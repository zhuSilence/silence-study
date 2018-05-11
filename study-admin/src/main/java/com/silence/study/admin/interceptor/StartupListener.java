package com.silence.study.admin.interceptor;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

/**
 * <br>
 * <b>功能：</b>项目启动监听<br>
 * <b>作者：</b>siber.xu<br>
 * <b>日期：</b>2015-11-01 11:35<br>
 * <b>详细说明：</b><br>
 */
public class StartupListener implements ApplicationListener {

    private static boolean isStart = false;

    @Override
    public void onApplicationEvent(ApplicationEvent event) {
        if (!isStart) {
            isStart = true;
            if (event instanceof ContextRefreshedEvent) {
                System.out.println("系统启动.............");
            }
        }
    }
}
