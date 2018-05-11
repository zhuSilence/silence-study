/**
 * Created by siber.xu on 2015/11/7.
 */

var SysLogOpGrid = DataGridClass.extend({

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
            field: 'createTime',
            title: '操作时间',
            sortable: true,
            query: {
                type: 'date'
            }
        }, {
            field: 'execTable',
            title: '数据库名',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'execSql',
            title: '执行的语句',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'elapsedTime',
            title: '耗用时间',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'userId',
            title: '操作者ID',
            sortable: true,
            query: {
                type: 'number'
            }
        }, {
            field: 'userName',
            title: '操作者名称',
            sortable: true,
            query: {
                type: 'text'
            }
        }, {
            field: 'execType',
            title: '执行动作',
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

$(function () {

    var opt = {
        idField: 'id'
    }
    var dataGrid = new SysLogOpGrid(opt);
    dataGrid.createGrid("#data-list");

});
