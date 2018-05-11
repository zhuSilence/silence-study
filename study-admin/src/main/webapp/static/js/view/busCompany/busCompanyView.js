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
            title: '自增主键',
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'companyName',
            title: '公司中文名称',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'companyEnglishName',
            title: '公司英文名称',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'address',
            title: '公司地址',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'registerTime',
            title: '公司注册成立时间',
            sortable: true,
            query : {
                type : 'date'            }
        }, {
            field: 'legalPerson',
            title: '法定代表人',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'registerAdd',
            title: '注册地',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'registerNumber',
            title: '注册号',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'registerMoney',
            title: '注册基本，单位万元人民币',
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'officialWebsite',
            title: '公司官网',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'recordStatus',
            title: '记录状态-1删除0草稿1发布2下线',
            sortable: true,
            query : {
                type : 'number'            }
        }, {
            field: 'contactPerson',
            title: '公司联系人',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'contactPhone',
            title: '联系电话',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'description',
            title: '公司描述',
            sortable: true,
            query : {
                type : 'text'
                            }
        }, {
            field: 'createTime',
            title: '记录创建时间',
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
        idField: 'companyId'
    };
    dataGrid = new BusCompanyGrid(opt);
    dataGrid.createGrid("#data-list");

});


/**
 * 处理修改回调方法
 */
var callback = function () {
    dataGrid.refreshAd();
};
