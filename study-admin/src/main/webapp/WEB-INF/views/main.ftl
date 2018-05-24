<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>管理系统后台</title>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/font-awesome/css/font-awesome.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/plugins/formValidator/theme-default.min.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/plugins/bootstrapDialog/bootstrap-dialog.min.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/plugins/nprogress/nprogress.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/css/css-loader.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/css/plugins-style-over.css"/>
    <link rel="stylesheet" href="${urls.StaticPath}/static/bootstrap/style.css"/>
</head>
<body>

<div class="wrapper">
    <nav class="header navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <a href="index.html" class="brand title">
                <span style="color: #ccc;">SILENCE</span><span style="color: #ccc">管理平台</span>
            </a>
            <ul class="nav pull-right">

                <!-- BEGIN USER LOGIN DROPDOWN -->
                <li class="dropdown user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img alt="" src="${urls.StaticPath}/static/images/avatar.gif" style="height:29px;"/>
                        <span class="username">${loginUser.userName!}</span>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fa fa-user"></i> 我的信息</a></li>
                        <li><a href="#"><i class="fa fa-calendar"></i> 我的日历</a></li>
                        <li><a href="#"><i class="fa fa-tasks"></i> 我的任务</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:;" id="btnModifyPwd" class="fa fa-key" title="修改密码"><i class="icon-key"></i> 修改密码</a></li>
                        <li><a href="${basePath}/logout.html"><i class="fa fa-sign-out"></i> 退出系统</a></li>
                    </ul>
                </li>
                <!-- END USER LOGIN DROPDOWN -->
            </ul>
        </div>
    </nav>
    <div class="menu-title">
        <h3 class="pull-left">Silence Study</h3>

        <div class="pull-right">
            <button class="btn btn-success btn-sm navbar-minimalize"><i class="fa fa-bars"></i></button>
        </div>
    </div>
    <div class="left">
        <!--
            左侧导航栏菜单，最大支持三级菜单
            二级ul样式为：nav-second-level
            三级ul样式为：nav-third-level
            功能跳转菜单样式：J_menuItem
         -->
        <nav class="sidebar-nav">
            <ul class="metismenu" id="menu">
                <#--<li class="active">
                    <a href="javascript:;"><i class="fa fa-joomla"></i><span> 系统配置</span><span
                            class="fa arrow"></span></a>
                    <ul class="nav-level-2">
                        <li>
                            <a href="${basePath}/welcome.html" class="J_menuItem">常用功能</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-arrows-alt"></i><span>快捷菜单栏</span><span class="fa arrow"></span></a>
                    <ul class="nav-level-2">
                        <li>
                            <a href="#"><i class="fa fa-arrows-alt"></i>功能管理<span class="fa arrow"></span></a>
                            <ul class="nav-level-3">
                                <li><a href="/setting/func/index" class="J_menuItem">开启功能</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>-->
            <@menuMacro menu_list=menusList paredtId= 0 level = 1 />
            <#macro menuMacro menu_list paredtId level>
                <!-- 导航菜单递归处理 参数说明：菜单列表，父ID，层级固定默认为1 配合自定义标签(@menuMacro)使用 -->
                <#list menu_list as menuitem>
                    <#if menuitem.pmid == paredtId>
                <li>
                    <#local level = level + 1/>
                    <#if menuitem.modle == 0>
                    <a href="javascript:;"><i class="${menuitem.iconClass}"></i><span>${menuitem.menuName!}</span><span class="fa arrow"></span></a>
                    <ul class="nav-level-${level} ">
                        <@menuMacro menu_list = menu_list paredtId= menuitem.menuId level = level />
                    </ul>
                    <#else>
                    <a href="${basePath + menuitem.iframeUrl!}<#if menuitem.iframeUrl?index_of('?')!=-1>&<#else>?</#if>menuId=${menuitem.menuId}" class="J_menuItem"><i class="${menuitem.iconClass}"></i><span>${menuitem.menuName!}</span></a>
                    <@menuMacro menu_list = menu_list paredtId= menuitem.menuId level = level />
                    </#if>
                    <#local level = level - 1/>
                </li>
                    </#if>
                </#list>
            </#macro>
            </ul>
        </nav>
    </div>
    <div class="content">
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-angle-double-left"></i></button>
            <nav class="page-tabs J_menuTabs" data-toggle="context">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="J_menuTab active" data-index="0" data-id="wellcome.html">管理首页 </a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-angle-double-right"></i></button>
            <div class="roll-nav roll-right dropdown J_tabClose"><span style="display:block;" class="dropdown-toggle"
                                                                       data-toggle="dropdown"
                                                                       aria-expanded="false">关闭<span
                    class="caret"></span></span>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabCurrClose"><a href="javascript:;">关闭选项卡</a></li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                </ul>
            </div>
        </div>
        <div id="content-main" class="row J_mainContent">
            <div id="loading" class="loading">
                <div class="loader loader-double is-active"></div>
            </div>
            <iframe width="100%" height="100%" frameborder="0" seamless="" src="${basePath}/welcome.html"
                    data-id="wellcome.html" name="iframe0" class="J_iframe"></iframe>
        </div>
        <#--<div class="footer">-->
            <#--<div class="pull-left">欢迎使用本系统！！！</div>-->
            <#--<div class="pull-right">-->
                <#--&copy; <span id="year"></span> <a target="_blank" href="#">Silence</a>-->
            <#--</div>-->
        <#--</div>-->
    </div>
</div>

<div id="tab-context-menu">
    <ul class="dropdown-menu" role="menu">
        <li class="J_tabCurrClose"><a href="javascript:;">关闭选项卡</a></li>
        <li class="J_tabCloseOther"><a href="javascript:;">关闭其他选项卡</a></li>
        <li class="divider"></li>
        <li class="J_tabCloseAll"><a href="javascript:;">关闭全部选项卡</a></li>
    </ul>
</div>

<div class="modal fade" id="modifyPwdModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document" style="width: 400px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="modifyPwdFrom" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">旧密码</label>
                        <div class="col-sm-9">
                            <input type="password" name="oldPwd" class="form-control" placeholder="旧密码" data-validation="required length" data-validation-length="min6">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">新密码</label>
                        <div class="col-sm-9">
                            <input type="password" name="newPwd" class="form-control" placeholder="新密码" data-validation="required length" data-validation-length="min6">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">确认密码</label>
                        <div class="col-sm-9">
                            <input type="password" name="confirmNewPwd" class="form-control" placeholder="确认密码" data-validation="required">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="btnModifyPwdSubmit" type="button" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

</body>
<script src="${urls.StaticPath}/static/bootstrap/jquery.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/bootstrap.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/metisMenu/metisMenu.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/bootstrapDialog/bootstrap-dialog.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/formValidator/jquery.form-validator.min.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/layer/layer.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/nprogress/nprogress.js"></script>

<script src="${urls.StaticPath}/static/js/common/alert.js"></script>
<script src="${urls.StaticPath}/static/js/common/contabs.js"></script>
<script src="${urls.StaticPath}/static/js/common/api.js"></script>
<script src="${urls.StaticPath}/static/js/common/jquery.oform.js"></script>
<script src="${urls.StaticPath}/static/bootstrap/plugins/bootstrap-contextmenu.js"></script>
<script src="${urls.StaticPath}/static/js/main.js"></script>
<script>
    var $basePath = '${basePath}';
    $('#year').text(new Date().Format("yyyy"))
</script>
</html>