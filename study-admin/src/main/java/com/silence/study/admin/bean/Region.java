package com.silence.study.admin.bean;


/**
 * Created by zhuxiang on 2016/9/24.
 * Desc : 省份城市信息model
 */
public class Region {
    private Integer id;
    private String name;
    //private Children[] children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /*public Children[] getChildren() {
        return children;
    }

    public void setChildren(Children[] children) {
        this.children = children;
    }*/
}
