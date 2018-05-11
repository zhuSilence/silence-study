<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司相册表-新增</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<#--<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [公司相册表] 增加公司相册表！
</div>-->
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
                                                                                                <div class="form-group">            <label class="col-sm-2 control-label">相册名称</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="albumName" data-validation="  length"  data-validation-length="max50">
                            </div>
                                                                                    <label class="col-sm-2 control-label">公司id</label>

            <div class="col-sm-4">
                                <input type="number" class="form-control" name="companyId" style="width: 200px;" value="0" >
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">相册描述</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="albumDesc" data-validation="  length"  data-validation-length="max200">
                            </div>
                                                                                    <label class="col-sm-2 control-label">创建人</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="creator" data-validation="  length"  data-validation-length="max50">
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">创建时间</label>

            <div class="col-sm-4">
                                <div class="form-group has-feedback" style="margin-bottom: 0px;width: 200px;margin-left: 0px;">
                                    <input name="createTime" class="form-control" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                    <span class="glyphicon glyphicon-calendar form-control-feedback" style="font-size: 18px;right: 0px;color: #2e6da4;" aria-hidden="true"></span>
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
<script src="${urls.StaticPath}/static/js/view/busAlbum/busAlbumAdd.js"></script>
</html>