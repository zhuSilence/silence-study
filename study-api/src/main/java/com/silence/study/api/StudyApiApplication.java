package com.silence.study.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration//配置控制
@EnableAutoConfiguration//启用自动配置
@EnableTransactionManagement//启用事务
@SpringBootApplication
@ComponentScan({"com.silence.study.*"})//组件扫
public class StudyApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(StudyApiApplication.class, args);
    }
}
