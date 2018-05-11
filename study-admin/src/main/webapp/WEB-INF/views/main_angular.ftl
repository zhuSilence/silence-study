<!DOCTYPE html>
<html lang="cn" ng-app="main">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${basePath}/static/bootstrap/css/bootstrap.min.css"/>
    <title>Test Angular</title>
</head>
<body  style="padding:10px;">
<p>测试</p>

<div id="abc" ng-controller="mainCtrl">
    <h4>当前账号：<span ng-bind="user.user"></span></h4>
    <div class="input-group">
        <input ng-model="task" type="text" class="form-control"/>
            <span class="input-group-btn">
                <button class="btn btn-default" ng-click="add()">提交</button>
            </span>
    </div>
    <h4 ng-if="taskList.length>0">任务列表</h4>
    <ul class="list-group">
        <li ng-repeat="item in taskList track by $index" class="list-group-item">
            <span ng-bind="item"></span>
            <a href="#" class="btn btn-default" ng-click="taskList.splice($index,1)"> 删除 </a>
        </li>
    </ul>
</div>

<div ng-controller="mainCtrl2">
    <p>{{titleName}}</p>
</div>

</body>
<script src="${urls.StaticPath}/static/angularjs/angular.min.js"></script>
<#--<script src="${urls.StaticPath}/static/js/module/userinfo.js"></script>-->
<script src="${urls.StaticPath}/static/js/main_angular.js"></script>
</html>