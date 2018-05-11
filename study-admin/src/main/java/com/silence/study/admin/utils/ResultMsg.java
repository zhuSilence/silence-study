package com.silence.study.admin.utils;

/**
 * 返回信息
 */
public class ResultMsg {

    private Boolean success;//状态
    private String code;    //代码
    private String msg;        //信息
    private Object data;    //返回数据

    private ResultMsg(){}

    public ResultMsg(Boolean success) {
        this.success = success;
    }

    public ResultMsg(Boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public ResultMsg(Boolean success, Object data, String msg) {
        this.success = success;
        this.data = data;
        this.msg = msg;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
