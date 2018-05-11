<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统菜单-详情</title>
<#include "../header.ftl"/>
</head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统菜单] 系统菜单详情！
</div>
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">菜单编号：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="menuId"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">菜单名称：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="menuName"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">元素ID：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="elid"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">节点图标样式：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="iconClass"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">TAB页ID：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="tabId"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">TAB页标题：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="tabTitle"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">TAB页图标样式：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="tabIcon"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">框架中打开URL：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="iframeUrl"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">排序：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="seq"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">打开模型0展开1TAB中打开2执行：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="modle"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">0正常1禁用：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="disabled"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">菜单操作权限：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="runMod"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">菜单父编号：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="pmid"></label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysMenu/sysMenuDetail.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>