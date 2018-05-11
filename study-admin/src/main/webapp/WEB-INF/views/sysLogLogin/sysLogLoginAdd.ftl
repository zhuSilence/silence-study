<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统登录日志-新增</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统登录日志] 增加系统登录日志！
</div>
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
                                                                                                <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>

                        <div class="col-sm-8">
                                                        <input type="text" class="form-control" name="userName" >
                                                    </div>
                    </div>
                </div>
                                                                                        <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户id</label>

                        <div class="col-sm-8">
                                                        <input type="number" class="form-control" name="userId" style="width: 200px;" value="0" >
                                                    </div>
                    </div>
                </div>
            </div>
                                                                        <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录时间</label>

                        <div class="col-sm-8">
                                                        <div class="form-group has-feedback" style="margin-bottom: 0px;width: 200px;margin-left: 0px;">
                                                            <input name="loginTime" class="form-control" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                                            <span class="glyphicon glyphicon-calendar form-control-feedback" style="font-size: 18px;right: 0px;color: #2e6da4;" aria-hidden="true"></span>
                            </div>
                                                    </div>
                    </div>
                </div>
                                                                                        <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户登录ip</label>

                        <div class="col-sm-8">
                                                        <input type="text" class="form-control" name="loginIp" >
                                                    </div>
                    </div>
                </div>
            </div>
                                                                        <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户浏览器信息</label>

                        <div class="col-sm-8">
                                                        <input type="text" class="form-control" name="userAgent" >
                                                    </div>
                    </div>
                </div>
                                                                                        <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录类型</label>

                        <div class="col-sm-8">
                                                        <input type="number" class="form-control" name="loginType" style="width: 200px;" value="0" >
                                                    </div>
                    </div>
                </div>
            </div>
                                                                        <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">说明</label>

                        <div class="col-sm-8">
                                                        <input type="text" class="form-control" name="remark" >
                                                    </div>
                    </div>
                </div>
            </div>
                                            </form>

        <div class="form-split"></div>
        <a id="btnBottomBack" class="btn btn-default" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>
        <a id="btnSave" class="btn btn-primary" href="javascript:;" role="button"><i class="fa fa-save"></i> 保存 </a>
        <a id="btnReset" class="btn btn-default" href="javascript:;" role="button"><i class="fa fa-refresh"></i> 重置 </a>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysLogLogin/sysLogLoginAdd.js"></script>
</html>