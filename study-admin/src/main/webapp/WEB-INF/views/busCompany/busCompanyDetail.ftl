<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司信息表-详情</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [公司信息表] 公司信息表详情！
</div>
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
                                    <div class="form-group">                <label class="col-sm-2 control-label">自增主键：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="companyId"></label>
                </div>
                                                    <label class="col-sm-2 control-label">公司中文名称：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="companyName"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">公司英文名称：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="companyEnglishName"></label>
                </div>
                                                    <label class="col-sm-2 control-label">公司地址：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="address"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">公司注册成立时间：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="registerTime"></label>
                </div>
                                                    <label class="col-sm-2 control-label">法定代表人：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="legalPerson"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">注册地：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="registerAdd"></label>
                </div>
                                                    <label class="col-sm-2 control-label">注册号：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="registerNumber"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">注册基本，单位万元人民币：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="registerMoney"></label>
                </div>
                                                    <label class="col-sm-2 control-label">公司官网：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="officialWebsite"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">记录状态-1删除0草稿1发布2下线：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="recordStatus"></label>
                </div>
                                                    <label class="col-sm-2 control-label">公司联系人：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="contactPerson"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">联系电话：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="contactPhone"></label>
                </div>
                                                    <label class="col-sm-2 control-label">公司描述：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="description"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">记录创建时间：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="createTime"></label>
                </div>
            </div>
                                </form>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/busCompany/busCompanyDetail.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>