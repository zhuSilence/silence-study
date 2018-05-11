<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>系统菜单</title>
    <#include "../header.ftl"/>
    <script>var MOD = ${mod!}; </script>
    </head>
<body>
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [系统菜单] 对系统菜单功能的管理！
</div>
<div class="wrapper">
    <div id="toolbar"></div>
    <table id="data-list"></table>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysMenu/sysMenuView.js"></script>
</html>