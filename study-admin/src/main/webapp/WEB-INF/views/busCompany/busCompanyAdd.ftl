<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司信息表-新增</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<#--<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [公司信息表] 增加公司信息表！
</div>-->
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
                                                                                                <div class="form-group">            <label class="col-sm-2 control-label">公司中文名称</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="companyName" data-validation="  length"  data-validation-length="max50">
                            </div>
                                                                                    <label class="col-sm-2 control-label">公司英文名称</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="companyEnglishName" data-validation="  length"  data-validation-length="max100">
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">公司地址</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="address" data-validation="  length"  data-validation-length="max500">
                            </div>
                                                                                    <label class="col-sm-2 control-label">公司注册成立时间</label>

            <div class="col-sm-4">
                                <div class="form-group has-feedback" style="margin-bottom: 0px;width: 200px;margin-left: 0px;">
                                    <input name="registerTime" class="form-control" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                                    <span class="glyphicon glyphicon-calendar form-control-feedback" style="font-size: 18px;right: 0px;color: #2e6da4;" aria-hidden="true"></span>
                </div>
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">法定代表人</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="legalPerson" data-validation="  length"  data-validation-length="max50">
                            </div>
                                                                                    <label class="col-sm-2 control-label">注册地</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="registerAdd" data-validation="  length"  data-validation-length="max100">
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">注册号</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="registerNumber" data-validation="  length"  data-validation-length="max50">
                            </div>
                                                                                    <label class="col-sm-2 control-label">注册基本，单位万元人民币</label>

            <div class="col-sm-4">
                                <input type="number" class="form-control" name="registerMoney" style="width: 200px;" value="0" >
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">公司官网</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="officialWebsite" data-validation="  length"  data-validation-length="max200">
                            </div>
                                                                                    <label class="col-sm-2 control-label">记录状态-1删除0草稿1发布2下线</label>

            <div class="col-sm-4">
                                <input type="number" class="form-control" name="recordStatus" style="width: 200px;" value="0" >
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">公司联系人</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="contactPerson" data-validation="  length"  data-validation-length="max50">
                            </div>
                                                                                    <label class="col-sm-2 control-label">联系电话</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="contactPhone" data-validation="  length"  data-validation-length="max20">
                            </div>
            </div>
                                                                        <div class="form-group">            <label class="col-sm-2 control-label">公司描述</label>

            <div class="col-sm-4">
                                <input type="text" class="form-control" name="description" data-validation="  length"  data-validation-length="max1000">
                            </div>
                                                                                    <label class="col-sm-2 control-label">记录创建时间</label>

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
<script src="${urls.StaticPath}/static/js/view/busCompany/busCompanyAdd.js"></script>
</html>