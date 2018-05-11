<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>用户管理-编辑</title>
<#include "../header.ftl"/>
</head>
<body style="background: #f2f2f2">
<#--<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [用户管理] 编辑用户管理！
</div>-->
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
            <input name="userId" type="hidden">

            <div class="form-group">
                <label class="col-sm-2 control-label">登录账号</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="loginName" data-validation="required" readonly="readonly">
                </div>
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" name="loginPwd" data-validation="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="userName">
                </div>
                <label class="col-sm-2 control-label">所属部门</label>
                <div class="col-sm-4">
                    <select name="deptId" class="selectpicker">
                    <#list deptList as dept>
                        <option value="${dept.deptId!}">${dept.deptName!}</option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮件地址</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="email" data-validation="email">
                </div>
                <label class="col-sm-2 control-label">备注</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="remark">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">禁用</label>
                <div class="col-sm-4">
                    <label class="radio-inline">
                        <input type="radio" name="disabled" value="0" checked="checked"> 否
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="disabled" value="1"> 是
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">选择角色</label>
                <div class="col-sm-10">
                <#list sysRoleList as sysRole>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="userRoleList" data-isArray="true"
                               value="${sysRole.roleId}"> ${sysRole.roleName}
                    </label>
                </#list>
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
<script src="${urls.StaticPath}/static/js/view/sysUser/sysUserEdit.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>