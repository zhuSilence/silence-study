/**
 * Created by xujianxin on 2016/12/7.
 */
var ToolsBar = jClass.extend({
    /* 初始化 */
    init: function (columns, options) {
        this.columns = columns;

        this.options = {
            toolbar: '#toolbar',
            findCallback: null,
            idField: 'id',
            align:'right'
        };
        $.extend(this.options, (options || {}));

        this.createTools();
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
            filterBox.push($this.getInputEl(n.query.type, n.query.field || n.field, n.query.data || []));
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
        //搜索
        $('#btnAdFilter').on('click', function () {
            $this.closeBaseSearch();
            var filterform_val = $('#filter-form').serializeJson();
            var params = {};
            if ($api.compare(ofilterform_val, filterform_val)) {
                //params = $this.refreshParam();
            } else {
                params = $.extend({}, filterform_val);
            }
            $this.findCallback(params);
        });
        //重置
        $('#btnFilterReset').on('click', function () {
            $this.closeBaseSearch();
            $('#filter-form').resetForm();
            $this.refresh();
        });
    },
    createTools: function () {
        var $this = this;

        //创建工具栏
        var toolbar = $('#toolbar');
        toolbar.addClass('btn-toolbar');

        var tools = [];
        /* 创建查询 */
        var query = $this.columns.filter(function (item) {
            return item.query != null;
        });
        if (query.length > 0) {
            //创建多条件搜索窗
            $this.createFilter(query);

            if($this.options.align == 'right'){
                tools.push('<div class="btn-toolbar pull-right">');
            }else{
                tools.push('<div class="btn-toolbar">');
            }

            tools.push('<div class="btn-group table-tools">');
            tools.push('<button id="btnFilter" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-filter"></i> <span>筛选</span> </button>');
            tools.push('<button id="btnRefresh" type="button" class="btn btn-default"> <i class="glyphicon glyphicon-refresh"></i> <span>刷新</span> </button>');
            tools.push('</div>');

            tools.push('<div class="btn-group table-tools">');
            tools.push('<form id="tool-search-form" class="form-inline">');
            tools.push('<select id="toolbar-select" class="selectpicker" data-width="120px"><option value="">请选择</option>');
            $.each(query, function (i, n) {
                if (n.query.toolsShow != false) {
                    tools.push('<option value="' + (n.query.field || n.field) + '">' + n.title + '</option>');
                }
            });
            tools.push('</select> ');
            tools.push('<span id="tool-val-box">');
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
                        $('#tool-val-box').append($this.getInputEl((n.query.type == 'btdate' ? 'date' : n.query.type), "tvb-value", n.query.data || []));
                        return;
                    }
                });
            });
            /* 查询按钮 */
            $('#toolbar').on('click', '#table-tools-btn-search', function () {
                var field = $('#toolbar-select').val();
                var val = $('[name=tvb-value]', '#tool-val-box').val();
                var params = {};
                if (field != null) {
                    var fields = field.split('.');
                    if (fields.length > 1) {
                        var valObj = {};
                        valObj[fields[1]] = val;
                        params[fields[0]] = valObj;
                    } else {
                        params[field] = val;
                    }
                }
                $this.findCallback(params);
            });
        }
        tools.push('</div>');
        toolbar.append(tools.join(''));

        //邦定搜索事件
        $('#btnFilter').on('click',function(){
            $('#filterBox').modal({backdrop: false});
        });
        //邦定刷新事件
        $('#btnRefresh').on('click', function () {
            $this.refresh();
        });
    },
    refresh: function () {
        this.closeBaseSearch();
        this.findCallback();
    },
    closeBaseSearch: function () {
        //关闭基本查询条件
        $('#tool-val-box').empty();
        $('#tool-search-form').resetForm();
    },
    findCallback: function (params) {
        if ($.isFunction(this.options.findCallback)) {
            this.options.findCallback(params || {});
        }
    },
    /* 根据类型获元素 */
    getInputEl: function (type, elid, values) {
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
                els.push('<input name="' + elid + '" class="inline form-control laydate-icon" style="display: inline-block;line-height: 1.3;height: 31px;" onclick="laydate({istime: false, format: \'YYYY-MM-DD\'})">');
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
                break;
        }
        return els.join('');
    }
});