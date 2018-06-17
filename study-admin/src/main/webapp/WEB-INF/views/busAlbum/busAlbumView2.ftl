<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>广告媒体库</title>
<#include "../header.ftl"/>
    <style>
        body{background: #f4f4f4;}
    </style>
    <script>var MOD = ${63}; </script>
</head>
<body>
<#--<div class="top-msg alert alert-success">-->
    <#--<button type="button" class="close" data-dismiss="alert" aria-label="Close">-->
        <#--<span aria-hidden="true">&times;</span>-->
    <#--</button>-->
    <#--[广告媒体库] 对广告媒体素材的管理-->
<#--</div>-->
<div class="wrapper">
    <div id="toolbar" class="btn-toolbar" style="margin: 10px 0 10px -5px;">
        <div class="btn-group">
            <button id="btnAdd" type="button" class="btn btn-primary">
                <i class="glyphicon glyphicon-plus"></i>
                <span>增加新素材</span>
            </button>
        </div>
        <#--<div class="btn-group table-tools">-->
            <#--<form class="form-inline">-->
                <#--<select class="selectpicker" data-width="120px">-->
                    <#--<option>测试内容</option>-->
                <#--</select>-->
                <#--<span id="tool-val-box"><input name="tvb-value" type="text" class="form-control"></span>-->
                <#--<a href="javascript:;" class="btn btn-default" style="float:inherit;" title="搜索">-->
                    <#--<i class="fa fa-search"></i>-->
                <#--</a>-->
            <#--</form>-->
        <#--</div>-->
    </div>

    <div id="pic-list" class="pic-list">
        <ul>
            <#--<li class="pic">-->
                <#--<div class="in">-->
                    <#--<div class="img-div">-->
                        <#--<img class="img-responsive" src="${basePath}/static/images/temp/dsp20161129144531_397.jpg">-->
                        <#--<span class="fa fa-file-image-o">-->
                    <#--</div>-->
                    <#--<div class="con-div">-->
                        <#--<div>-->
                            <#--<h2 class="tit_"></span> 1031关机广告素材广告广告广告广告广告广告</h2>-->
                        <#--</div>-->
                        <#--<p>-->
                            <#--<span>状态：</span><span class="state">已审核</span>-->
                            <#--<a href="javascript:;" class="btn btn-xs btn-salad-c">送审</a>-->
                            <#--<span class="pull-right">2016-11-29</span>-->
                        <#--</p>-->
                    <#--</div>-->
                <#--</div>-->
            <#--</li>-->
        </ul>
    </div>

    <!-- 分页标签 -->
    <div id="page" class="m-pagination"></div>
</div>
</body>
<script>
    var $mediaServerUrl = '${mediaServerUrl!}';
    //var adxNodeServerUrl = '${adxNodeServerUrl!}';
</script>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/busAlbum/busAlbumView2.js"></script>
</html>