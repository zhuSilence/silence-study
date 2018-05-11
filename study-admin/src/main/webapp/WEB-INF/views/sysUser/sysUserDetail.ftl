<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <title>用户管理-详情</title>
<#include "../header.ftl"/>
</head>
<body style="background: #f2f2f2">
<div class="top-msg alert alert-success">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
    [用户管理] 用户管理详情！
</div>
<div class="opt-wrapper">
    <div class="opt-content">
        <a class="btn btn-default" id="btnBack" href="javascript:;" role="button"> <i
                class="glyphicon glyphicon-menu-left"></i> 返回 </a>

        <div class="form-split"></div>
        <h4 class="form-title">基本信息</h4>

        <div class="form-split"></div>

        <form id="form" class="form-horizontal">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">ID：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="userId"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名称：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="userName"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">部门编号：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="deptId"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">账号：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="loginName"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">邮件地址：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="email"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">最后登录时间：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="loginTime"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">最后登录IP：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="loginIp"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">登录次数：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="loginCount"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">禁用：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="disabled"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="remark"></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">创建时间：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="createDate"></label>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">修改时间：</label>

                        <div class="col-sm-7">
                            <label class="control-label val" name="modifyDate"></label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<#include '../foot.ftl'/>
<script src="${urls.StaticPath}/static/js/view/sysUser/sysUserDetail.js"></script>
<script type="text/javascript">
    var id = ${id};
</script>
</html>