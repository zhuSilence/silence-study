/**
 * Created by siber.xu on 2015/11/7.
 */

var SysDeptGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'deptId',
            title: '部门ID',
            sortable: true,
            width: 100,
            query: {
                type: 'number'
            }
        }, {
            field: 'deptName',
            title: '部门名称',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'deptTel',
            title: '部门电话',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'deptFax',
            title: '部门传真',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'seq',
            title: '排序',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'disabled',
            title: '禁用',
            sortable: true,
            formatter: basicFn.formatBoolean,
            query: {
                type: 'number'
            }
        }, {
            field: 'remark',
            title: '备注',
            sortable: true,
            query: {
                type: 'text'
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
        idField: 'deptId'
    }
    dataGrid = new SysDeptGrid(opt);
    dataGrid.createGrid("#data-list");

});

/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};