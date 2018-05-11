package com.silence.study.api.config;

import com.origin.eurybia.jdbc.plugin.mybatis.PagePlugin;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Created by xujianxin on 16/9/20.
 */
@Configuration
@MapperScan(basePackages = {"com.silence.study.*.mapper"})
public class MyBatisConfig {

    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {

        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);

        //分页插件
        PagePlugin pagePlugin = new PagePlugin();
        Properties properties = new Properties();
        properties.put("databaseType","mysql");
        pagePlugin.setProperties(properties);
        sessionFactory.setPlugins(new Interceptor[]{pagePlugin});

        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        Resource[] classPathResource = resolver.getResources("classpath*:com/silence/study/**/*Mapper.xml");
        sessionFactory.setMapperLocations(classPathResource);

        return sessionFactory.getObject();
    }

}
