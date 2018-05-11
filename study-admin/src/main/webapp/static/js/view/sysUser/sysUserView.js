/**
 * Created by siber.xu on 2015/11/7.
 */

var SysUserGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'userName',
            title: '用户名称',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'sysDept',
            title: '所属部门',
            sortable: true,
            formatter: function (v, row, index) {
                return v.deptName;
            },
            query: {
                type: 'text',
                field: 'sysDept.deptName'
            }
        }, {
            field: 'loginName',
            title: '账号',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'email',
            title: '邮件地址',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'loginIp',
            title: '最后登录IP',
            sortable: true
        }, {
            field: 'loginCount',
            title: '登录次数',
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
            field: 'createDate',
            title: '创建时间',
            sortable: true,
            formatter:basicFn.formatDate
        }, {
            field: 'modifyDate',
            title: '修改时间',
            sortable: true,
            formatter:basicFn.formatDate
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
        idField: 'userId'
    };
    dataGrid = new SysUserGrid(opt);
    dataGrid.createGrid("#data-list");

});

/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};
