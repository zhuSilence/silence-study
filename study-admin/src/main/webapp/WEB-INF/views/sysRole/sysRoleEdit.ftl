<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统用户角色-编辑</title>
<#include "../header.ftl"/>
</head>
<body style="background: #f2f2f2">
<#--<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统用户角色] 编辑系统用户角色！
</div>-->
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
            <input name="roleId" type="hidden">

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色名称</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="roleName" data-validation="required  length"
                                   data-validation-length="max30">
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">排序号</label>

                        <div class="col-sm-8">
                            <input type="number" class="form-control" name="seq" style="width: 200px;" value="0">
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">说明</label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="roleRemark" data-validation="  length" data-validation-length="max30">
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
<script src="${urls.StaticPath}/static/js/view/sysRole/sysRoleEdit.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>