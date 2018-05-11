<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统菜单-编辑</title>
<#include "../header.ftl"/>
</head>
<body style="background: #f2f2f2">
<#--<div class="top-msg alert alert-success">-->
    <#--<button type="button" class="close" data-dismiss="alert" aria-label="Close">-->
        <#--<span aria-hidden="true">&times;</span>-->
    <#--</button>-->
    <#--[系统菜单] 编辑系统菜单！-->
<#--</div>-->
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
            <input name="menuId" type="hidden">

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜单名称</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="menuName">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜单编号</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="elid">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图标样式</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="iconClass">
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">URL</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="iframeUrl">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">排序</label>

                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="seq" style="width: 200px;" value="0">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">模型</label>

                        <div class="col-sm-8">
                            <select name="modle" class="form-control">
                                <option value="0">菜单</option>
                                <option value="1">页面</option>
                                <option value="2">命令</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">禁用</label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="disabled" value="0" checked="checked"> 否
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="disabled" value="1"> 是
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">菜单父编号</label>

                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="pmid" style="width: 200px;" value="0">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label class="col-sm-1 control-label">操作列表</label>

                        <div class="col-sm-10">
                            <input type="hidden" name="runMod" value="0">
                        <#list sysRunList as sysRun>
                            <label class="checkbox-inline">
                                <input type="checkbox" name="sysRunCheckbox" value="${sysRun.runMod}"> ${sysRun.runName}
                            </label>
                        </#list>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <div class="form-split"></div>
        <a id="btnBottomBack" class="btn btn-default" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>
        <a id="btnSave" class="btn btn-primary" href="javascript:;" role="button"><i class="fa fa-save"></i> 保存 </a>
        <a id="btnReset" class="btn btn-default" href="javascript:;" role="button"><i class="fa fa-refresh"></i> 重置 </a>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysMenu/sysMenuEdit.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>