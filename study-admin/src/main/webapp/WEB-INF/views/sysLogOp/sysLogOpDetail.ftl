<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统操作日志-详情</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统操作日志] 系统操作日志详情！
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
                        <label class="col-sm-3 control-label">ID：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="id"></label>
                        </div>
                    </div>
                </div>
                                                    <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">操作时间：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="createTime"></label>
                        </div>
                    </div>
                </div>
            </div>
                                    <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">耗用时间：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="elapsedTime"></label>
                        </div>
                    </div>
                </div>
                                                    <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">执行的语句：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="execSql"></label>
                        </div>
                    </div>
                </div>
            </div>
                                    <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">执行人id：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="userId"></label>
                        </div>
                    </div>
                </div>
                                                    <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">执行人名称：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="userName"></label>
                        </div>
                    </div>
                </div>
            </div>
                                    <div class="row">                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">动作,delete update insert：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="execType"></label>
                        </div>
                    </div>
                </div>
                                                    <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">操作表：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="execTable"></label>
                        </div>
                    </div>
                </div>
            </div>
                                </form>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysLogOp/sysLogOpDetail.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>