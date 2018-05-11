<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司相册表-详情</title>
    <#include "../header.ftl"/>
    </head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [公司相册表] 公司相册表详情！
</div>
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
                                    <div class="form-group">                <label class="col-sm-2 control-label">相册id：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="albumId"></label>
                </div>
                                                    <label class="col-sm-2 control-label">相册名称：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="albumName"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">公司id：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="companyId"></label>
                </div>
                                                    <label class="col-sm-2 control-label">相册描述：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="albumDesc"></label>
                </div>
            </div>
                                    <div class="form-group">                <label class="col-sm-2 control-label">创建人：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="creator"></label>
                </div>
                                                    <label class="col-sm-2 control-label">创建时间：</label>
                <div class="col-sm-4">
                    <label class="control-label val" name="createTime"></label>
                </div>
            </div>
                                </form>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/busAlbum/busAlbumDetail.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>