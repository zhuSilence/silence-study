package com.silence.study.admin.service;

import com.silence.study.admin.bean.ChartDataBean;
import com.origin.eurybia.redis.RedisClientUtil;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * <br>
 * <b>功能：</b>欢迎页面service<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2016-10-31 10:18<br>
 * <b>详细说明：</b>无<br>
 */
@Service
public class WelcomeService {

    private static final String today_pv_key = "incr_today_pv";

    @Autowired
    private RedisClientUtil redisClientUtil;

    /**
     * 获取当前总数量
     *
     * @return
     */
    public Map<String, Long> getTodayTotalNum() {

        Map<String, Long> map = new HashMap<>();
        map.put("totalNum", new Long(0));
        map.put("usedNum", new Long(0));

        return map;
    }

    /**
     * 获取当天投放数据
     *
     * @return
     */
    public Map<String, ChartDataBean> getTodayDspData() {

        Map<String, ChartDataBean> spacePvMap = new HashedMap();

        return spacePvMap;
    }
}
