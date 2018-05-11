package com.silence.study.admin.bean;

import com.silence.study.core.model.sys.SysUserModel;

/**
 * <br>
 * <b>功能：</b>登录实体<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-22 14:43<br>
 * <b>详细说明：</b><br>
 */
public class LoginBean extends SysUserModel {

    private String verifyCode; //   验证码

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }
}
