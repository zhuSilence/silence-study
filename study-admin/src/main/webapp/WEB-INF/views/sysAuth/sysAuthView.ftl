<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>角色权限管理</title>
<#include "../header.ftl"/>
</head>
<body>
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [角色权限] 对角色权限功能的管理！
</div>
<div class="wrapper">
    <div class="row">
        <div class="col-md-2">
            <div id="toolbar">
                <div class="btn-group">
                    <button id="btnSave" type="button" class="btn btn-default"> <i class="fa fa-save"></i><span> 保存</span></button>
                </div>
            </div>
            <table id="role-data-list"></table>
        </div>
        <div class="col-md-10" style="padding-top: 55px;padding-bottom: 30px;">
            <table id="menus-data-list"></table>
        </div>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysAuth/sysAuthView.js"></script>
</html>