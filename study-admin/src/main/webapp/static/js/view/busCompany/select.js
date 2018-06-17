/**
 * Created by siber.xu on 2015/11/7.
 */

var BusCompanyGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'companyId',
            title: 'ID',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'companyName',
            title: '中文名称',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'companyEnglishName',
            title: '英文名称',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'address',
            title: '公司地址',
            sortable: false,
            visible: false
        }, {
            field: 'registerTime',
            title: '注册时间',
            visible: false,
            sortable: false
        }, {
            field: 'legalPerson',
            title: '法定代表人',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'registerAdd',
            title: '注册地',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'registerNumber',
            title: '注册号',
            sortable: false,
            visible: false,
            query: {
                type: 'text'
            }
        }, {
            field: 'registerMoney',
            title: '注册资本',
            sortable: false,
            visible: false
        }, {
            field: 'officialWebsite',
            title: '公司官网',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'recordStatus',
            title: '状态',
            sortable: true,
            formatter: function (value) {
                if (value === 2) {
                    return '下线';
                } else if (value === 1) {
                    return '发布中';
                } else if (value === 0) {
                    return '草稿';
                } else if (value === -1) {
                    return '删除';
                } else {
                    return '未知状态';
                }
            },
            query: {
                type: 'select',
                data: [
                    {name: "草稿", value: "0"},
                    {name: "发布中", value: "1"},
                    {name: "下线", value: "2"},
                    {name: "删除", value: "-1"},
                ]
            }
        }, {
            field: 'contactPerson',
            title: '公司联系人',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'contactPhone',
            title: '联系电话',
            sortable: true
        }, {
            field: 'description',
            title: '公司描述',
            visible: false,
            sortable: false
        }, {
            field: 'createTime',
            title: '创建时间',
            sortable: true,
            width:100,
            formatter: function (v) {
                return (new Date(v).Format('yyyy-MM-dd'));
            },
            query: {
                type: 'date'
            }
        }];
        this._super(columns, opt);
    },
    urls: {
        data_list: 'pageList.html'
    }
});

var dataGrid;
$(function () {

    var opt = {
        idField: 'companyId',
        showOperate: false,
        showColumns: false,
        singleSelect: true,
        sortName:'createTime',
        sortOrder:'desc'
    };
    dataGrid = new BusCompanyGrid(opt);
    dataGrid.createGrid("#data-list");

    var index = parent.layer.getFrameIndex(window.name);
    //确认选择
    $('#btn-select').click(function () {
        var row = dataGrid.utils().getCheckedRows();
        if (row.length > 0) {
            parent.setData(row[0]);
            parent.layer.close(index);
        } else {
            $alert.error('请选择一条记录!');
        }
    });

});


/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};
