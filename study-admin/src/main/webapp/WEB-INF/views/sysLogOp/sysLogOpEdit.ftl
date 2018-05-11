<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统操作日志-编辑</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统操作日志] 编辑系统操作日志！
</div>
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
            <input name="id" type="hidden">
                                                                                                <div class="row">            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">操作时间</label>

                    <div class="col-sm-8">
                                                <div class="form-group has-feedback" style="margin-bottom: 0px;width: 200px;margin-left: 0px;">
                                                        <input name="createTime" class="form-control" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                                        <span class="glyphicon glyphicon-calendar form-control-feedback" style="font-size: 18px;right: 0px;color: #2e6da4;" aria-hidden="true"></span>
                        </div>
                                            </div>
                </div>
            </div>

                                                                                    <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">耗用时间</label>

                    <div class="col-sm-8">
                                                <input type="number" class="form-control" name="elapsedTime" style="width: 200px;" value="0" >
                                            </div>
                </div>
            </div>

            </div>
                                                                        <div class="row">            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">执行的语句</label>

                    <div class="col-sm-8">
                                                <input type="text" class="form-control" name="execSql" >
                                            </div>
                </div>
            </div>

                                                                                    <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">执行人id</label>

                    <div class="col-sm-8">
                                                <input type="number" class="form-control" name="userId" style="width: 200px;" value="0" >
                                            </div>
                </div>
            </div>

            </div>
                                                                        <div class="row">            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">执行人名称</label>

                    <div class="col-sm-8">
                                                <input type="text" class="form-control" name="userName" >
                                            </div>
                </div>
            </div>

                                                                                    <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">动作,delete update insert</label>

                    <div class="col-sm-8">
                                                <input type="text" class="form-control" name="execType" >
                                            </div>
                </div>
            </div>

            </div>
                                                                        <div class="row">            <div class="col-md-6">
                <div class="form-group">
                    <label class="col-sm-2 control-label">操作表</label>

                    <div class="col-sm-8">
                                                <input type="text" class="form-control" name="execTable" >
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
<script src="${urls.StaticPath}/static/js/view/sysLogOp/sysLogOpEdit.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>