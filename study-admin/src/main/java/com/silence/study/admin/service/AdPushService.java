package com.silence.study.admin.service;

import com.origin.eurybia.utils.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b><br>
 * <b>作者：</b>silence<br>
 * <b>日期：</b>2017-02-20 15:18<br>
 * <b>详细说明：</b>无<br>
 */
@Service
public class AdPushService {

    private final static String apiKey;
    private final static String appId;
    private final static String pushSingleUrl;
    private final static String pushBatchUrl;
    private final static String pushLabelUrl;
    private final static String pushTagPushUrl;


    static {
        Prop prop = PropertiesUtil.use();
        apiKey = prop.get("apiKey");
        appId = prop.get("appId");
        pushSingleUrl = prop.get("pushSingleUrl");
        pushBatchUrl = prop.get("pushBatchUrl");
        pushLabelUrl = prop.get("push.label.url");
        pushTagPushUrl = prop.get("push.tagPush.url");
    }

    /**
     * 单条推送
     *
     * @param pushId
     * @param msg
     * @param ttl
     * @return
     * @throws Exception
     */
    public String pushSingle(String pushId, String msg, Integer ttl) throws Exception {
        String curTimeStr = String.valueOf(System.currentTimeMillis());
        Map<String, String> map = new HashMap<>();
        map.put("pushId", pushId);
        map.put("msg", msg);
        map.put("ttl", String.valueOf(ttl));
        String token = MD5Util.md5(appId + apiKey + curTimeStr + msg);
        map.put("token", token);
        map.put("timeStamp", curTimeStr);
        map.put("appId", appId);
        HttpClientUtil httpUtil = new HttpClientUtil();
        return httpUtil.requestGetUrlToJSON(pushSingleUrl, map);

    }


    /**
     * 批量推送
     *
     * @param pushIds
     * @param msg
     * @param ttl
     * @return
     * @throws Exception
     */
    public String pushBatch(String pushIds, String msg, Integer ttl) throws Exception {
        String timeStamp = String.valueOf(System.currentTimeMillis());
        Map<String, String> map = new HashMap<>();
        map.put("appId", appId);
        String token = MD5Util.md5(appId + apiKey + timeStamp + msg);
        map.put("token", token);
        map.put("timeStamp", timeStamp);
        map.put("pushIds", pushIds);
        map.put("msg", msg);
        map.put("ttl", String.valueOf(ttl));
        HttpClientUtil httpUtil = new HttpClientUtil();
        return httpUtil.requestPOSTUrlToJSON(pushBatchUrl, map);

    }


    /**
     * 调用push系统的标签推送接口
     *
     * @param tagList
     * @param regionList
     * @param msg
     * @param ttl
     * @return
     * @throws Exception
     */
    public String tagPush(String tagList, String regionList, String msg, String ttl) throws Exception {
        String timeStamp = String.valueOf(System.currentTimeMillis());
        Map<String, String> map = new HashMap<>();
        map.put("appId", appId);
        map.put("token", MD5Util.md5(appId + apiKey + String.valueOf(timeStamp) + msg));
        map.put("timeStamp", timeStamp);
        map.put("msg", msg);
        map.put("tag", tagList);
        map.put("ttl", ttl);
        map.put("provinceCode", regionList);
        map.put("cityCode", "");
        HttpClientUtil httpUtil = new HttpClientUtil();
        return httpUtil.requestPOSTUrlToJSON(pushTagPushUrl, map);

    }


    /**
     * Get方式获取push系统的标签
     *
     * @return
     * @throws Exception
     */

}
