package com.silence.study.admin.bean;

/**
 * <br>
 * <b>功能：</b>修改密码<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-12-15 23:40<br>
 * <b>详细说明：</b><br>
 */
public class ModifyPwdBean {

    private String oldPwd;
    private String newPwd;
    private String confirmNewPwd;

    public String getOldPwd() {
        return oldPwd;
    }

    public void setOldPwd(String oldPwd) {
        this.oldPwd = oldPwd;
    }

    public String getNewPwd() {
        return newPwd;
    }

    public void setNewPwd(String newPwd) {
        this.newPwd = newPwd;
    }

    public String getConfirmNewPwd() {
        return confirmNewPwd;
    }

    public void setConfirmNewPwd(String confirmNewPwd) {
        this.confirmNewPwd = confirmNewPwd;
    }
}
