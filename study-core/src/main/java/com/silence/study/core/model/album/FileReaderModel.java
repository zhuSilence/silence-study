package com.silence.study.core.model.album;

/**
 * <br>
 * <b>功能：</b><br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-28 22:15<br>
 * <b>详细说明：</b>无<br>
 */
public class FileReaderModel {
    private Integer height;
    private long lastModified;
    private String name;
    private Integer size;
    private String src;
    private String type;
    private String webkitRelativePath;
    private Integer width;

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public long getLastModified() {
        return lastModified;
    }

    public void setLastModified(long lastModified) {
        this.lastModified = lastModified;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getWebkitRelativePath() {
        return webkitRelativePath;
    }

    public void setWebkitRelativePath(String webkitRelativePath) {
        this.webkitRelativePath = webkitRelativePath;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }
}
