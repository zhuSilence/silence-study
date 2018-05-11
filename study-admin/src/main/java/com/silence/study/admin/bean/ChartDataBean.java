package com.silence.study.admin.bean;

/**
 * <br>
 * <b>功能：</b>统计数据bean<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2016-10-31 10:48<br>
 * <b>详细说明：</b>无<br>
 */
public class ChartDataBean {

    private String name;
    private String type;
    private int[] data;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int[] getData() {
        return data;
    }

    public void setData(int[] data) {
        this.data = data;
    }
}
