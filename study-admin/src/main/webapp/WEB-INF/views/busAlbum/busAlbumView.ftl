<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司相册表</title>
    <#include "../header.ftl"/>
        <script>var MOD = ${mod!}; </script>
</head>
<body>
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [公司相册表] 对公司相册表功能的管理！
</div>
<div class="wrapper">
    <div id="toolbar"></div>
    <table id="data-list"></table>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/busAlbum/busAlbumView.js"></script>
</html>