/**
 * Created by siber.xu on 2015/11/7.
 */
var selectRowIndex = 0;
var SysAuth = jClass.extend({
    init: function () {
        var columns = [{
            field: 'state',
            text: '选择',
            radio: true,
            width: 40,
            align: 'center'
        }, {
            field: 'roleName',
            title: '角色名称',
            align: 'left'
        }];


        var menuData = [];

        var menusColumns = [{
            field: 'menuName',
            title: '菜单名称',
            formatter: function (v, row) {
                if (row.pmid == 0) {
                    v = "[+] " + v;
                } else if (row.modle != 0 && row.pmid != 0) {
                    v = "&nbsp;&nbsp;&nbsp;&nbsp;" + v;
                } else if (row.modle == 0 && row.pmid != 0) {
                    v = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[+] " + v;
                }
                return v + '<input type="hidden" value="' + row.menuId + '"/>';
            }

        }, {
            field: 'all',
            title: '全选',
            align: 'center',
            width: 80,
            formatter: function (v) {
                return '<input type="checkbox" name="rowCheckAll" />';
            }
        }];

        $api.post('getMenuList.html', function (data) {
            $.each(data.sysMenus, function (i, n) {
                var itemObj = {};
                itemObj.menuId = n.menuId;
                itemObj.menuName = n.menuName;
                itemObj.runMod = n.runMod;
                itemObj.modle = n.modle;
                itemObj.pmid = n.pmid;
                $.each(data.sysRuns, function (k, t) {
                    itemObj[t.runComm] = t;
                });
                menuData.push(itemObj);
            });
            $.each(data.sysRuns, function (i, n) {
                menusColumns.push({
                    field: n.runComm,
                    title: n.runName,
                    align: 'center',
                    width: 100,
                    formatter: function (v, row) {
                        var el = '<input type="checkbox" name="checkItem" ' + ((row.runMod & n.runMod) === 0 ? "disabled" : "") + ' value="' + n.runMod + '"/>';
                        return el;
                    }
                })
            });

            $('#menus-data-list').bootstrapTable({
                clickToSelect: true,
                method: 'post',
                //toolbar: '#toolbar',
                pagination: false,
                columns: menusColumns,
                data: menuData
                //url: "getMenuList.html"
            });

            $('#role-data-list').bootstrapTable({
                singleSelect: true,
                clickToSelect: true,
                method: 'post',
                toolbar: '#toolbar',
                pagination: false,
                columns: columns,
                data: data.sysRoles,
                //url: "getRoleList.html",
                onCheck: function (row) {//onCheck
                    //alert(row.roleMenuModList.length);
                    selectRowIndex = $.inArray(row, data.sysRoles);
                    var trEls = $('#menus-data-list tbody tr');
                    $(trEls).find('input[type="checkbox"]').prop('checked', false);
                    $(trEls).each(function (i, n) {
                        var menuId = $(n).find('input[type="hidden"]').val();
                        $.each(row.roleMenuModList, function (k, m) {
                            if (menuId == m.menuId) {
                                var checkedNum = 0;
                                var checkboxEls = $(n).find('input[type="checkbox"][name="checkItem"]').not(':disabled');
                                $(checkboxEls).each(function (y, x) {
                                    if (($(x).val() & m.runMod) > 0) {
                                        $(x).prop('checked', true);
                                        checkedNum++;
                                    }
                                });
                                if (checkedNum == checkboxEls.length) {
                                    $(n).find('input[type="checkbox"][name="rowCheckAll"]').prop('checked', true);
                                }
                            }
                        });
                    });
                }
            });
        });

        $('#btnSave').click(function () {
            var selectRow = $('#role-data-list').bootstrapTable('getSelections');
            var trEls = $('#menus-data-list tbody tr');
            var menuMods = [];
            $(trEls).each(function (i, n) {
                var menuId = $(n).find('input[type="hidden"]').val();
                var mod = 0;
                var checkboxEls = $(n).find('input[type="checkbox"][name="checkItem"]:checked');
                $(checkboxEls).each(function (y, x) {
                    mod = mod | $(x).val();
                });
                if (mod > 0) {
                    menuMods.push({roleId: selectRow[0].roleId,menuId: menuId, runMod: mod});
                }
            });
            if(menuMods.length==0){
                menuMods.push({roleId: selectRow[0].roleId});
            }
            $api.post('save.html', menuMods, function (data) {
                if (data.success) {
                    $alert.alert("保存成功!");
                    selectRow.roleMenuModList = menuMods;
                    $('#role-data-list').bootstrapTable('updateRow', {index:selectRowIndex,row:selectRow});
                } else {
                    $alert.alert("保存失败!");
                }
            });
        });
    }
})
$(function () {
    var sysAuth = new SysAuth();

    $('#menus-data-list').on('click', 'input[type="checkbox"][name="rowCheckAll"]', function () {
        var val = $(this).is(':checked');
        $(this).parent().parent().find('input[type="checkbox"][name="checkItem"]').not(':disabled').prop("checked", val);
    });

    $('#menus-data-list').on('click', 'input[type="checkbox"][name="checkItem"]', function () {
        var checkItems = $(this).parent().parent().find('input[type="checkbox"][name="checkItem"]').not(':disabled');
        var checkVal = true;
        $(checkItems).each(function (i, n) {
            if (!$(n).is(':checked')) {
                checkVal = false;
            }
        });
        $(this).parent().parent().find('input[type="checkbox"][name="rowCheckAll"]').prop("checked", checkVal);
    })
});
