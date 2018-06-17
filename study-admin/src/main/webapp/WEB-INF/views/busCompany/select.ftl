<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>公司信息表</title>
    <#include "../header.ftl"/>
        <script>var MOD = ${49}; </script>
</head>
<body>
<div class="wrapper">
    <div id="toolbar">
        <button id="btn-select" type="button" class="btn btn-primary">选定数据</button>
    </div>
    <table id="data-list"></table>
</div>
<div class="wrapper">
    <div id="toolbar"></div>
    <table id="data-list"></table>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/busCompany/select.js"></script>
</html>