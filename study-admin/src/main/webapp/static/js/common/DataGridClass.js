/**
 * 表格插件通用类
 * 使用方法：
 * 首先需要继承该类
 * 构造函数：
 * columns-- 表格中列的配置
 * {
 * field:字段名
 * title:标题名称
 * query:是否可过滤{type:标签类型['text','select','date'],data[下拉列表数据],toolsShow:工具栏是否显示默认为true}
 * }
 * options-- bootstrapTable配置
 *  Created by siber.xu on 2015/11/7.
 */
var qparmas = {};
var DataGridClass = jClass.extend({
    /* 初始化 */
    init: function (columns, options) {
        this.DataGrid;
        this.columns = columns;
        this.options = {
            //search: true,
            //showRefresh: true,
            //showToggle: true,
            textEllipsis: false,//文本省略
            showOperate: true,//是不显示右侧操作栏
            optWidth: 100,//操作栏宽度
            optCallback: null,//操作栏格式化回调
            showColumns: true,
            clickToSelect: true,
            method: 'post',
            toolbar: '#toolbar',
            pagination: true,
            pageSize: 15,
            pageList: [15, 30, 50, 100],
            queryParams: this.queryParams,
            fixedParams: {},//固定参数
            sidePagination: 'server',
            url: this.urls.data_list,
            idField: 'id'
        };
        $.extend(this.options, (options || {}));
        //默认操作路径
        var defaultUrl = {
            data_list: 'pageList.html',
            add: 'add.html',
            edit: 'edit.html',
            save: 'save.html',
            remove: 'remove.html',
            detail: 'detail.html'
        };
        $.extend(this.urls, defaultUrl);

    },
    /* 创建搜索窗 */
    createFilter: function (queryArray) {
        var $this = this;
        var filterBox = [];
        filterBox.push('<div class="modal fade" id="filterBox" tabindex="-1" role="dialog">');
        filterBox.push('<div class="modal-dialog" role="document" style="width: 700px;margin: 0px auto;">');
        filterBox.push('<div class="modal-content" style="border-top-left-radius: 0px;border-top-right-radius: 0px;">');
        filterBox.push('<div class="modal-body">');
        filterBox.push('<form id="filter-form" class="form-horizontal">');
        var index = 0;
        $.each(queryArray, function (i, n) {
            if (index % 2 == 0) {
                filterBox.push('<div class="form-group">');
            }
            filterBox.push('<label class="col-sm-2 control-label" for="' + n.field + '" style="font-weight: normal;padding-right:10px;">' + n.title + '</label>');
            if(n.query.type == 'btdate'){
                filterBox.push('<div class="col-sm-10">');
                index++;
            }else{
                filterBox.push('<div class="col-sm-4">');
            }
            filterBox.push($this.utils().getInputEl(n.query.type, n.query.field || n.field, n.query.data || [], n.query.tvbOperator || 'like', false));
            filterBox.push('</div>');
            if (index % 2 != 0 || i == (queryArray.length - 1)) {
                filterBox.push('</div>');
            }
            index++;
        });
        filterBox.push('</form>');
        filterBox.push('</div>');
        filterBox.push('<div class="modal-footer">');
        filterBox.push('<button type="button" id="btnAdFilter" class="btn btn-primary">搜索</button>');
        filterBox.push('<button type="button" id="btnFilterReset" class="btn btn-default">重置</button>');
        filterBox.push('<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>');
        filterBox.push('</div>');
        filterBox.push('</div>');
        filterBox.push('</div>');
        filterBox.push('</div>');
        $('body').append(filterBox.join(''));
        var ofilterform_val = $('#filter-form').serializeJson();
        $('#btnAdFilter').on('click', function () {
            $this.closeBaseSearch();
            var filterform_val = $('#filter-form').serializeJson();
            if ($api.compare(ofilterform_val, filterform_val)) {
                qparmas = $this.refreshParam();
            } else {
                qparmas = $.extend({}, $this.refreshParam(), filterform_val);
            }
            $this.DataGrid.bootstrapTable('refresh');
        });
        $('#btnFilterReset').on('click', function () {
            $this.closeBaseSearch();
            $('#filter-form').resetForm();
            $this.refresh();
        });
    },
    /* 创建工具栏 */
    createTools: function () {
        var $this = this;
        var toolbarEl = this.options.toolbar;
        var toolMod = MOD || 0;

        //创建工具栏
        var toolbar = $(toolbarEl);
        toolbar.addClass('btn-toolbar');

        var tools = [];
        tools.push('<div class="btn-group">');
        if((toolMod & 2) > 0) {
            tools.push('<button id="btnAdd" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-plus"></i> <span>新增</span> </button>');
        }
        if((toolMod & 4) > 0) {
            tools.push('<button id="btnEdit" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-edit"></i> <span>修改</span> </button>');
        }
        if((toolMod & 8) > 0) {
            tools.push('<button id="btnDel" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-trash"></i> <span>删除</span> </button>');
        }
        if((toolMod & 16) > 0) {
            tools.push('<button id="btnFilter" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-filter"></i> <span>筛选</span> </button>');
        }
        if((toolMod & 32) > 0) {
            tools.push('<button id="btnRefresh" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-refresh"></i> <span>刷新</span> </button>');
        }
        if((toolMod & 256)){
            tools.push('<button id="btnExport" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-export"></i> <span>导出</span> </button>');
        }
        if((toolMod & 1024)){
            tools.push('<button id="btnOperate" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-option-vertical"></i> <span>操作</span> </button>');
        }
        tools.push('</div>');
        toolbar.prepend(tools.join(''));
        tools = [];

        /* 创建查询 */
        var query = $this.columns.filter(function (item) {
            return item.query != null;
        });
        if (query.length > 0) {
            //创建搜索框
            $this.createFilter(query);

            tools.push('<div class="btn-group table-tools">');
            tools.push('<form id="tool-search-form" class="form-inline" style="margin-top: -2px;">');
            tools.push('<select id="toolbar-select" class="form-control" style="width:110px;"><option value="">请选择</option>');
            $.each(query, function (i, n) {
                if(n.query.toolsShow != false){
                    tools.push('<option value="' + (n.query.field || n.field) + '">' + n.title + '</option>');
                }
            });
            tools.push('</select> ');
            tools.push('<span id="tool-val-box">');
            //tools.push('<input type="text" style="width: 200px;" class="form-control">');
            tools.push('</span> ');
            tools.push('<a class="btn btn-default" id="table-tools-btn-search" href="javascript:;" role="button" style="float: inherit;" title="搜索"><i class="fa fa-search"></i></a>');
            tools.push('</form>');
            tools.push('</div>');
            /* 查询条件处理 */
            $('#toolbar').on('change', '#toolbar-select', function () {
                if ($(this).val() == '') {
                    $('#tool-val-box').empty();
                    return;
                }
                var currVal = $(this).val();
                $.each(query, function (i, n) {
                    if ($.inArray(n.field, currVal.split('.')) >= 0) {
                        $('#tool-val-box').empty();
                        //基本查询暂不支持时间范围
                        $('#tool-val-box').append($this.utils().getInputEl((n.query.type == 'btdate' ? 'date' : n.query.type), "tvb-value", n.query.data || [], n.query.tvbOperator || 'like', true));
                        return;
                    }
                });
            });
            /* 查询按钮 */
            $('#toolbar').on('click', '#table-tools-btn-search', function () {
                var field = $('#toolbar-select').val();
                var val = $('[name=tvb-value]', '#tool-val-box').val();
                var tvbOperator = $('[name=tvbOperator]', '#tool-val-box').val();
                if ((field == null || field == '') && (val == null || val == '')) {
                    qparmas = $this.refreshParam();
                    // if($("#startDate").val()!="" || $("#endDate").val()!=""){
                    //     qparmas['startDate']=$("#startDate").val();
                    //     qparmas['endDate']=$("#endDate").val();
                    // }
                    $this.DataGrid.bootstrapTable('refresh');
                } else if (field != '' && val != '') {
                    qparmas = $this.refreshParam();
                    var fields = field.split('.');
                    if (fields.length > 1) {
                        var valObj = {};
                        valObj[fields[1]] = val;
                        qparmas[fields[0]] = valObj;
                    } else {
                        qparmas[field] = val;
                    }
                    if (tvbOperator != null && tvbOperator != '') {
                        qparmas['tvbOperator'] = tvbOperator;
                    }
                    // if($("#startDate").val()!="" || $("#endDate").val()!=""){
                    //     qparmas['startDate']=$("#startDate").val();
                    //     qparmas['endDate']=$("#endDate").val();
                    // }
                    $this.DataGrid.bootstrapTable('refresh');
                }else {
                    $alert.msg('请输入查询条件！');
                }
            });
        }
        toolbar.append(tools.join(''));

        //邦定新增事件
        $('#btnAdd').on('click', function () {
            $this.add();
        });
        //邦定修改事件
        $('#btnEdit').on('click', function () {
            var selectRow = $this.utils().getCheckedRows();
            if ($this.utils().checkSelect()) {
                var ids = $.map(selectRow, function (row) {
                    return row[$this.getIdField()];
                });
                $this.edit(ids[0]);
            }
        });
        //邦定删除事件
        $('#btnDel').on('click', function () {
            var selectRow = $this.utils().getCheckedRows();
            if ($this.utils().checkSelect()) {
                var ids = $.map(selectRow, function (row) {
                    return row[$this.getIdField()];
                });
                $this.delete(ids);
            }
        });
        //邦定搜索事件
        $('#btnFilter').on('click',function(){
            $('#filterBox').modal({backdrop: false});
        });
        //邦定刷新事件
        $('#btnRefresh').on('click', function () {
            $this.refresh();
        });
        //邦定导出
        $('#btnExport').on('click', function () {
            //window.location.href = this.urls.extend;

            var temp = document.createElement("form");
            temp.action = $this.urls.export;
            temp.method = "post";
            temp.style.display = "none";
            for (var x in qparmas) {
                var opt = document.createElement("textarea");
                opt.name = x;
                opt.value = qparmas[x];
                temp.appendChild(opt);
            }
            document.body.appendChild(temp);
            temp.submit();
            return temp;
            //
            // $api.post($this.urls.export, qparmas, function () {
            // });
        });

        //操作按钮
        $('#btnOperate').on('click', function () {
            var selectRow = $this.utils().getCheckedRows();
            if ($this.utils().checkSelect()) {
                var ids = $.map(selectRow, function (row) {
                    return row[$this.getIdField()];
                });
                $this.btnOperation(ids);
            }
        });

    },
    /* 创建表格 */
    createGrid: function (elId) {
        var $this = this;

        //显示操作栏
        if($this.options.showOperate){
            $this.columns.push({
                field: 'operate',
                title: '操作',
                align: 'center',
                width: $this.options.optWidth,
                events: {
                    'click .detail': function (e, value, row, index) {
                        $this.detail(row[$this.getIdField()]);
                    },
                    'click .edit': function (e, value, row, index) {
                        $this.edit(row[$this.getIdField()]);
                    },
                    'click .remove': function (e, value, row, index) {
                        $this.delete([row[$this.getIdField()]]);
                    }
                },
                formatter: function (val, row) {
                    var modified = true;
                    if ($.isFunction($this.options.optCallback)) {
                        modified = $this.options.optCallback(row);
                    }
                    return $this.getOperateEl(modified).join('');
                }
            })
        }
        if ($this.options.textEllipsis) {
            $(elId).css({"table-layout": "fixed"});
            $.each($this.columns, function (i, n) {
                n.cellStyle = function cellStyle() {
                    return {
                        css: {"overflow": "hidden", "white-space": "nowrap", "text-overflow": "ellipsis"}
                    };
                }
            });
        }
        $this.options.columns = $this.columns;
        $this.DataGrid = $(elId || '#data-list');
        $this.DataGrid.bootstrapTable($this.options);
        //发生无法正确加载数据时使用
        //setTimeout(function () {
        //    this.DataGrid.bootstrapTable('resetView');
        //}, 500);

        //生成工具栏
        $this.createTools();
    },
    /* 数据URL */
    urls: {
        //获取dataGrid数据URL
        //add_view : '/sysUser/add.html',
        //edit_view : '/sysUser/edit.html',
        //data_list : '/sysUser/pageList.html',
        //tools : '/sysUser/getMenuInfo.html',
        //export: ''
    },
    queryParams: function (params) {
        $.extend(params, qparmas);
        //排序查询，处理子表的排序
        if (params.sort != null && params.sort != '') {
            $.each(this.columns[0], function (i, n) {
                if (n.field == params.sort && n.query != null && n.query.field != null) {
                    params.sort = n.query.field;
                }
            });
        }
        return params;
    },
    setFixedParam:function(param){
        //设置固定参数
        $.extend(this.options.fixedParams, param);
        $.extend(qparmas, this.options.fixedParams);
    },
    refreshParam:function(){
        //重置参数
        qparmas = $.extend({}, this.options.fixedParams, {});
        return qparmas;
    },
    getIdField: function () {
        //获取ID字段名
        return this.options.idField;
    },
    add: function () {
        $alert.window(false, this.urls.add);
        //window.location.href = this.urls.add;
    },
    edit: function (id) {
        this.utils().editRow(id);
    },
    delete: function (ids) {
        this.utils().deleteRow(ids);
    },
    detail: function (id) {
        //window.location.href = this.urls.detail + '?id=' + id;
        $alert.window(false, this.urls.detail + '?id=' + id);
    },
    btnOperation: function (ids) {

    },
    refresh: function () {
        qparmas = this.refreshParam();
        this.closeBaseSearch();
        this.DataGrid.bootstrapTable('refresh');
    },
    closeBaseSearch:function(){
        //关闭基本查询条件
        $('#tool-val-box').empty();
        $('#tool-search-form').resetForm();
    },
    hideColumn:function () {
        if(arguments.length == 0){
            this.DataGrid.bootstrapTable('hideColumn',"operate");
        }else {
            for(var i = 0; i < arguments.length; i++){
                this.DataGrid.bootstrapTable('hideColumn',arguments[i]);
            }
        }
    },
    getOperateEl: function (modified) {
        var toolMod = MOD || 0;
        var operateEl = [];
        operateEl.push('<a class="detail" href="javascript:void(0)" disabled="true" title="查看">');
        operateEl.push('<i class="fa fa-eye"></i></a>');
        if ((toolMod & 4) > 0) {
            operateEl.push('&nbsp;&nbsp;&nbsp;');
            if (modified) {
                operateEl.push('<a class="edit" href="javascript:void(0)" title="修改">');
            } else {
                operateEl.push('<a href="javascript:void(0)" title="修改" style="color: #ccc">');
            }
            operateEl.push('<i class="glyphicon glyphicon-pencil"></i></a>');
        }
        if ((toolMod & 8) > 0) {
            operateEl.push('&nbsp;&nbsp;&nbsp;');
            if (modified) {
                operateEl.push('<a class="remove" href="javascript:void(0)" title="删除">');
            } else {
                operateEl.push('<a href="javascript:void(0)" title="删除" style="color: #ccc">');
            }
            operateEl.push('<i class="glyphicon glyphicon-trash"></i></a>');
        }
        return operateEl;
    },
    refreshAd: function (qparmas) {
        $('#tool-val-box').empty();
        $('#tool-search-form').resetForm();
        this.DataGrid.bootstrapTable('refresh');
    },
    refreshWithParams: function () {
        this.DataGrid.bootstrapTable('refresh');
    },
    /* 工具类 */
    utils: function () {
        var $this = this;
        return {
            getCheckedRows: function () {
                return $this.DataGrid.bootstrapTable('getSelections');
            },
            checkSelect: function (rows) {
                var rows = rows || $this.utils().getCheckedRows();
                if (rows.length == 0) {
                    $alert.alert('请至少选择一条记录！');
                    return false;
                }
                return true;
            },
            deleteRow: function (ids) {
                $alert.confirm('确认要删除选中的数据吗？', function () {
                    $api.post($this.urls.remove, ids, function (data) {
                        if (data.success) {
                            $this.DataGrid.bootstrapTable('remove', {
                                field: $this.getIdField(),
                                values: ids
                            });
                        }
                    });
                });
            },
            editRow: function (id) {
                $alert.window(false, $this.urls.edit + '?id=' + id);
                //window.location.href = $this.urls.edit + '?id=' + id;
            },
            /* 根据类型获元素 */
            getInputEl:function(type,elid,values,tvbOperator, flag){
                var els = [];
                switch (type) {
                    case 'select':
                        els.push('<select name="' + elid + '" class="form-control">');
                        els.push('<option value="">请选择</option>');
                        $.each(values || [], function (k, j) {
                            els.push('<option value="' + j.value + '">' + j.name + '</option>');
                        });
                        els.push('</select>');
                        break;
                    case 'date':
                        // els.push('<div class="form-group has-feedback" style="margin-bottom: 0px;">');
                        // els.push('<input name="' + elid + '" class="form-control" onclick="laydate({istime: false, format: \'YYYY-MM-DD\'})">');
                        // els.push('<span class="glyphicon glyphicon-calendar form-control-feedback" style="font-size: 18px;right: 0px;color: #2e6da4;" aria-hidden="true"></span>');
                        // els.push('</div>');
                        els.push('<input name="' + elid + '" class="inline laydate-icon form-control" style="max-width: 200px;display: inline-block;line-height: 1.3;height: 31px;" onclick="laydate({istime: false, format: \'YYYY-MM-DD\'})">');
                        break;
                    case 'btdate':
                        els.push('<input name="startDateX" class="inline form-control laydate-icon" style="max-width: 160px;display: inline-block;line-height: 1.3;height: 31px;" onclick="laydate({istime: false, format: \'YYYY-MM-DD\'})">');
                        els.push(' 至 ');
                        els.push('<input name="endDateX" class="inline laydate-icon form-control" style="max-width: 160px;display: inline-block;line-height: 1.3;height: 31px;" onclick="laydate({istime: false, format: \'YYYY-MM-DD\'})">');
                        break;
                    case 'number':
                        els.push('<input name="' + elid + '" type="number" class="form-control">');
                        break;
                    default :
                        els.push('<input name="' + elid + '" type="text" class="form-control">');
                        if(flag) {
                            els.push('<input name="tvbOperator" value="'+ tvbOperator +'" type="hidden" class="form-control">');
                        }
                        break;
                }
                return els.join('');
            }
        }
    }
});
//推迟500毫秒后渲染表格列使其能够拖动改变大小
$(function () {
    resize();
});
var resize = function () {
    setTimeout(function () {
        //销毁之前的表格拖动绑定
        $("#data-list").resizableColumns("destroy");
        //绑定新的拖动
        $("#data-list").resizableColumns();
        //下拉菜单增加或减少列的时候重新触发
        $('ul.dropdown-menu label').on('click', function () {
            resize();
        })
    }, 500);
};

//监听回车键搜索功能
$('body #toolbar').on('keydown', 'input', function (e) {
    let theEvent = e || window.event;
    let code = theEvent.keyCode || theEvent.which || theEvent.charCode;
    if (code == 13) {
        //回车执行查询
        theEvent.preventDefault();
        $('#table-tools-btn-search').trigger('click');
    }
});