package com.silence.study.admin.service;

import com.origin.eurybia.utils.HttpClientUtil;
import com.origin.eurybia.utils.JsonUtils;
import com.origin.eurybia.utils.Prop;
import com.origin.eurybia.utils.PropertiesUtil;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>广告基础信息<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2017-03-29 20:11<br>
 * <b>详细说明：</b>无<br>
 */
@Service
public class AdBaseService {

    private final static String bigDataDeviceUrl;


    static {
        Prop prop = PropertiesUtil.use();
        bigDataDeviceUrl = prop.get("big.data.device.url");
    }

    /**
     * 获取设备信息列表
     *
     * @return
     * @throws Exception
     */
//    public List<DeviceTagModel> getDeviceTags() throws Exception {
//        HttpClientUtil httpUtil = new HttpClientUtil();
//        Map<String, String> map = new HashMap<>();
//        String respone = httpUtil.requestGetUrlToJSON(bigDataDeviceUrl, map);
//        return JsonUtils.json2List(respone, DeviceTagModel.class);
//    }
}
