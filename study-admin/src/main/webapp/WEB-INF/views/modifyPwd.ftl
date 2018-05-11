<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <#include "header.ftl"/>
</head>
<body>
    <form id="modifyPwdFrom" class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">旧密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" placeholder="旧密码" data-validation="required">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">新密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" placeholder="新密码" data-validation="required">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" placeholder="确认密码" data-validation="required">
            </div>
        </div>
    </form>
</body>
<#include "foot.ftl"/>
</html>