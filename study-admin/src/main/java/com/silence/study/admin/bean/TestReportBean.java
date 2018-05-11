package com.silence.study.admin.bean;

import java.math.BigInteger;

/**
 * Created by changhuating on 2017/3/17.
 */
public class TestReportBean {
    //"orderNo", "orderName", "scheduleNo", "agentName","scheduleName", "mediaType", "statDate", "province", "city", "sum(pv) as pv", "sum(uv) as uv","sum(total_traffic) as totalTraffic");
    private String orderNo;
    private String orderName;
    private String scheduleNo;
    private String agentName;
    private String scheduleName;
    private String mediaType;
    private String statDate;
    private String province;
    private String city;
    private Integer imagePv = 0;
    private Integer videoPv = 0;
    private Integer uv = 0;
    private BigInteger totalTraffic;
    private int sum;

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getScheduleNo() {
        return scheduleNo;
    }

    public void setScheduleNo(String scheduleNo) {
        this.scheduleNo = scheduleNo;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getScheduleName() {
        return scheduleName;
    }

    public void setScheduleName(String scheduleName) {
        this.scheduleName = scheduleName;
    }

    public String getMediaType() {
        return mediaType;
    }

    public void setMediaType(String mediaType) {
        this.mediaType = mediaType;
    }

    public String getStatDate() {
        return statDate;
    }

    public void setStatDate(String statDate) {
        this.statDate = statDate;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getImagePv() {
        return imagePv;
    }

    public void setImagePv(Integer imagePv) {
        this.imagePv = imagePv;
    }

    public Integer getVideoPv() {
        return videoPv;
    }

    public void setVideoPv(Integer videoPv) {
        this.videoPv = videoPv;
    }

    public Integer getUv() {
        return uv;
    }

    public void setUv(Integer uv) {
        this.uv = uv;
    }

    public BigInteger getTotalTraffic() {
        return totalTraffic;
    }

    public void setTotalTraffic(BigInteger totalTraffic) {
        this.totalTraffic = totalTraffic;
    }
}
