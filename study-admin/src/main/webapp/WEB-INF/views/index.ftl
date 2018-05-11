<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
<#--<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Pragma" content="no-cache"/>-->
    <title>管理系统后台</title>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/plugins/bootstrapDialog/bootstrap-dialog.min.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/plugins/ladda/ladda-themeless.min.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/plugins/nprogress/nprogress.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/css/plugins-style-over.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/css/index.css"/>
</head>
<body class="login">
<div class="logo">
    <h3>管理系统后台</h3>
</div>
<div class="content">
    <div class="content-bg"></div>
    <form id="form">
        <h3 class="form-title">请输入您的账号和密码</h3>

        <div class="form-group control-group">
            <span class="input-icon fa fa-user"></span>
            <input type="text" class="form-control" name="userName" placeholder="用户名" maxlength="30"
                   data-validation="required" data-validation-error-msg="用户名不能为空！" value="">
        </div>
        <div class="form-group control-group">
            <span class="input-icon fa fa-lock"></span>
            <input type="password" class="form-control" name="loginPwd" placeholder="密码" maxlength="30"
                   data-validation="required" data-validation-error-msg="密码不能为空！" value="">
        </div>
        <div class="form-inline">
            <div class="form-group control-group">
                <input type="text" class="form-control" name="verifyCode" placeholder="验证码" maxlength="4"
                       data-validation="required" data-validation-error-msg="验证码不能为空！"
                       style="width: 100px;padding:10px;">
            </div>
            <div class="form-group control-group">
                <img id="verifyCode" style="cursor: pointer;" src="${basePath}/captcha.jpg" alt="点击刷新" title="点击刷新"/>
            </div>
        </div>
        <div class="form-group control-group">
            <a href="javascript:;" id="btnLogin" class="btn btn-primary ladda-button" data-style="expand-left">
                <span class="ladda-label">登录</span>
            </a>
        </div>
        <div class="form-split"></div>
        <#--<div>-->
            <#--<h4>忘记密码？</h4>-->
            <#--<p>-->
                <#--请发送邮件 <a href="mailto:xujianxin@coocaa.com">xujianxin@coocaa.com</a>-->
                <#--提出申请重设密码.-->
            <#--</p>-->
        <#--</div>-->
    </form>
</div>
<div class="copyright">
    <span id="year"></span> © Management System by Silence
</div>
</body>
<script src="${urls.StaticPath}/static/bootstrap/jquery.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/bootstrap.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/formValidator/jquery.form-validator.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/layer/layer.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/bootstrapDialog/bootstrap-dialog.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/ladda/spin.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/ladda/ladda.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/ladda/ladda.jquery.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/nprogress/nprogress.js"></script>
<script src="${urls.StaticPath}/static/js/common/jquery.oform.js"></script>
<script src="${urls.StaticPath}/static/js/common/alert.js"></script>
<script src="${urls.StaticPath}/static/js/common/common.js"></script>
<script src="${urls.StaticPath}/static/js/common/api.js"></script>
<script src="${urls.StaticPath}/static/js/common/jClass.js"></script>
<script>
    var $basePath = '${basePath}';
    $('#year').text(new Date().Format("yyyy"))
</script>
<script src="${urls.StaticPath}/static/js/index.js"></script>
</html>