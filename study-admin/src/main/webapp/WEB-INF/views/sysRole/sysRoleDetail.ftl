<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统用户角色-详情</title>
<#include "../header.ftl"/>
</head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统用户角色] 系统用户角色详情！
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
                        <label class="col-sm-3 control-label">角色编号：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="roleId"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">角色名称：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="roleName"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">排序号：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="seq"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">说明：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="roleRemark"></label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysRole/sysRoleDetail.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>