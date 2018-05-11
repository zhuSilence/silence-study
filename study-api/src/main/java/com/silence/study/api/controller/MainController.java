package com.silence.study.api.controller;

import com.silence.study.core.service.sys.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <br>
 * <b>功能：</b><br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-08 00:00<br>
 * <b>详细说明：</b>无<br>
 */
@Controller
public class MainController {

    @Autowired
    private SysUserService sysUserService;

    @RequestMapping(value = "index")
    @ResponseBody
    public String index() {
        System.out.println(sysUserService.queryList().size());
        return "index";
    }
}
