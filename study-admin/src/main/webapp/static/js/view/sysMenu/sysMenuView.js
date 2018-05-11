/**
 * Created by siber.xu on 2015/11/7.
 */

var SysMenuGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'menuId',
            title: '菜单编号',
            sortable: true,
            width: '10px',
            query: {
                type: 'number'
            }
        },{
            field: 'menuName',
            title: '菜单名称',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'elid',
            title: '元素ID',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'iconClass',
            title: '节点图标样式',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'iframeUrl',
            title: 'URL',
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
            field: 'modle',
            title: '模型',
            sortable: true,
            query: {
                type: 'number'
            },
            formatter: function (value) {
                if (value == 0) {
                    return '菜单';
                } else if (value == 1) {
                    return '页面';
                } else if (value == 2) {
                    return '命令';
                }
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
            field: 'pmid',
            title: '父菜单',
            sortable: true,
            query: {
                type: 'number'
            }
        }];
        this._super(columns, opt);
    },
    urls: {
        data_list: 'pageList.html'
    }
})

var dataGrid;
$(function () {

    var opt = {
        idField: 'menuId',
        sortName: 'menuId',
        sortOrder: 'desc',
    }
    dataGrid = new SysMenuGrid(opt);
    dataGrid.createGrid("#data-list");

});

/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};