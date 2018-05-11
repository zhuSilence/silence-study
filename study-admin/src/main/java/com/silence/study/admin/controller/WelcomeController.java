package com.silence.study.admin.controller;

import com.silence.study.admin.base.BaseController;
import com.silence.study.admin.bean.ChartDataBean;
import com.silence.study.admin.service.WelcomeService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * <br>
 * <b>功能：</b>欢迎页面相关<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2016-10-31 10:15<br>
 * <b>详细说明：</b>无<br>
 */
@Controller
public class WelcomeController extends BaseController {

    @Autowired
    private WelcomeService welcomeService;

    @RequestMapping(value = "welcome", method = RequestMethod.GET)
    public ModelAndView welcomeView() {

        Map<String, Object> paramMap = new HashedMap();
        paramMap.putAll(welcomeService.getTodayTotalNum());

        /*HttpServletRequest request = ServletUtil.getRequest();
        Cookie[] cookies = request.getCookies();
        String pathname = null;
        if (cookies != null) {
            for (int i = 0, size = cookies.length; i < size; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("prePathname") && !cookie.getValue().equals("/")) {
                    pathname = cookie.getValue();
                    System.out.println("prePathname= " + pathname);
                }
            }
        }*/
        /*if (pathname != null) {
            *//*String [] tempPathname=pathname.split("\\.");
            pathname=tempPathname[0].substring(1);*//*
            RenderView("welcome", paramMap);
            return new ModelAndView("redirect:" + pathname);
            //String []path=pathname.split("/");
            //System.err.println(path[1]);
            //return RenderView(path[1]+"/"+path[1]+"View",new HashedMap());

        } else {
            return RenderView("welcome", paramMap);
        }*/


        return RenderView("welcome", paramMap);
    }

    /**
     * 获取投放数据
     *
     * @param dataType
     * @return
     */
    @RequestMapping(value = "getDspData")
    @ResponseBody
    public Map<String, ChartDataBean> getDspData(Integer dataType) {

        Map<String, ChartDataBean> resMap = new HashedMap();
        switch (dataType) {
            case 0://当天数据
                resMap = welcomeService.getTodayDspData();
                break;
        }
        return resMap;
    }
}
