/**
 * Created by siber.xu on 2015/11/7.
 */

var BusAlbumGrid = DataGridClass.extend({

    init: function (opt) {

        var columns = [{
            field: 'state',
            checkbox: true,
            align: 'center'
        }, {
            field: 'albumId',
            title: '相册id',
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'albumName',
            title: '相册名称',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'companyId',
            title: '公司id',
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'albumDesc',
            title: '相册描述',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'creator',
            title: '创建人',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'createTime',
            title: '创建时间',
            sortable: true,
            query : {
                type : 'date'            }
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
        idField: 'albumId'
    };
    dataGrid = new BusAlbumGrid(opt);
    dataGrid.createGrid("#data-list");

});


/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};
