<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>首页管理</title>
<#include "header.ftl"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/css/welcome.css"/>
    <script>var MOD = 1; </script>
    <style>
        .space_data {
            border: 1px solid #e3e8ed;
            background: #f7f8f9;
            margin-bottom: 10px;
        }
        .space_data .tit{
            margin: 6px 0 4px 10px;
        }

        .tit {
            font-size: 12px;
        }

        .nums {
            line-height: 20px;
            font-size: 16px;
            margin: 0 0 3px 12px;
        }
    </style>
</head>
<body style="background-color: #f4f4f4;height:500px">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-4">
            <div class="data-part">
                <div class="data-logo">
                    <span class="fa fa-bar-chart"></span>
                </div>
                <div class="data-detail">
                    <h3>广告投放单据</h3>
                    <ul>
                        <li><span class="tit">投放中：</span><a class="nums" href="#">${usingCount!}</a></li>
                        <li><span class="tit">待上线：</span><a class="nums" href="#">${auditedCount!}</a></li>
                        <li><span class="tit">待审核：</span><a class="nums" href="#">${auditingCount!}</a></li>
                        <li><span class="tit">草&nbsp;&nbsp;&nbsp;稿：</span><a class="nums" href="#">${savedCount!}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="data-part baog">
                <div class="data-logo">
                    <span class="fa fa-skyatlas"></span>
                </div>
                <div class="data-detail">
                    <h3>今日曝光量</h3>
                    <ul>
                        <li><span class="tit">可曝光总量：</span><a class="nums" href="#">${totalNum!}</a></li>
                        <li><span class="tit">实际曝光数：</span><a class="nums" href="#">${usedNum!}</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="data-part err">
                <div class="data-logo">
                    <span class="fa fa-unlink"></span>
                </div>
                <div class="data-detail">
                    <h3>监测诊断</h3>
                    <ul>
                        <li><span class="tit">监测代码发送异常：</span><a class="nums" href="#">${htqErrNum!}</a></li>
                        <li><span class="tit">客户端异常数：</span><a class="nums" href="#">${clientError!}</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="show-chart">
        <div class="chart-nav">
            <p class="tit">投放情况 <span>(当天数据会有1分钟延时)</span></p>
            <div class="r">
                <select id="selDspDate" class="selectpicker" data-width="160px">
                    <option class="3">过去一个月</option>
                    <option class="2">过去七天</option>
                    <option value="1">过去三天</option>
                    <option value="0" selected>今天:${.now?string('yyyy-MM-dd')}</option>
                </select>
            </div>
        </div>
        <div class="row show-data" id="show-data">

        </div>

    <#--<ul id="show-data">
        <li>
            <p class="tit">开机广告(PV)</p>
            <p class="nums">-</p>
        </li>
        <li>
            <p class="tit">屏保广告(PV)</p>
            <p class="nums">-</p>
        </li>
        <li>
            <p class="tit">应用启动(PV)</p>
            <p class="nums">-</p>
        </li>
        <li>
            <p class="tit">关机广告(PV)</p>
            <p class="nums">-</p>
        </li>
    </ul>
</div>-->
    <#--<div class="chart-box">
        <div id="statChart" class="chart">
        </div>
    </div>-->
    </div>
    <div class="row">
        <div class="col-sm-9">
            <div class="order-block">
                <h3>投放中计划单<span>(TOP6)</span></h3>
                <div class="data-top">
                    <div class="data">
                        <table id="scheduleTable"></table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="order-block">
                <h3>投放中计划单</h3>
                <div class="data-top">
                    <p class="nodata">
                        <i class="fa fa-file-text-o"></i>暂无数据
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<#--<div id='app' class="wrapper wrapper-content" style="background-color: white;height:500px;">-->
<#--<div class="row">-->
<#--<div class="col-sm-12">-->

<#--<table id="data-list"></table>-->
<#--</div>-->

<#--</div>-->

<#--</div>-->

</body>
<#include 'foot.ftl'/>
<script src="${urls.StaticPath}/static/js/echarts/echarts1.min.js"></script>
<script src="${urls.StaticPath}/static/js/welcome.js"></script>

</html>