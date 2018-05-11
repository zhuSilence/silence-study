/**
 * Created by siber.xu on 2015/11/7.
 */

var SysRoleGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'roleId',
            title: '角色编号',
            width: 100,
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'roleName',
            title: '角色名称',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'seq',
            title: '排序号',
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'roleRemark',
            title: '说明',
            sortable: true,
            query : {
                type : 'text'
                            }
        }]
        this._super(columns, opt);
    },
    urls: {
        data_list: 'pageList.html'
    }
})

var dataGrid;
$(function () {

    var opt = {
        idField: 'roleId'
    }
    dataGrid = new SysRoleGrid(opt);
    dataGrid.createGrid("#data-list");

});

/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};