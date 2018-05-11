/**
 * Created by siber.xu on 2015/11/7.
 */

var SysLogLoginGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'id',
            title: 'ID',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'userId',
            title: '用户编号',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'userName',
            title: '用户名',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'loginTime',
            title: '登录时间',
            sortable: true,
            query: {
                type: 'date'
            }
        }, {
            field: 'loginIp',
            title: '登录IP',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'userAgent',
            title: '用户浏览器信息',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'loginType',
            title: '登录类型',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'remark',
            title: '说明',
            sortable: true,
            query: {
                type: 'text'
            }
        }];
        this._super(columns, opt);
    },
    urls: {
        data_list: 'pageList.html'
    }
});

$(function () {

    var opt = {
        idField: 'id'
    };
    var dataGrid = new SysLogLoginGrid(opt);
    dataGrid.createGrid("#data-list");

});
