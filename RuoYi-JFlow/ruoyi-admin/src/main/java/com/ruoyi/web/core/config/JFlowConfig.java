package com.ruoyi.web.core.config;

import java.util.Hashtable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import bp.da.DataType;
import bp.difference.redis.RedisUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import bp.difference.ContextHolderUtils;
import bp.difference.GvtvPropertyPlaceholderConfigurer;
import bp.difference.SystemConfig;

/**
 * JFlow配置
 * @author Bryce Han
 *
 */
@Configuration
@ComponentScan(basePackages = {"bp.difference"})
public class JFlowConfig {

    private static final Logger logger = LoggerFactory.getLogger(JFlowConfig.class);

    private static ApplicationContext applicationContext;

    @Autowired
    Environment env;

    /**
     * 属性文件jflow.properties配置
     * @return
     */
  /*  @Bean
    public static GvtvPropertyPlaceholderConfigurer propertyConfigurer() {
        GvtvPropertyPlaceholderConfigurer propertyConfigurer = new GvtvPropertyPlaceholderConfigurer();
        ResourceLoader resourceLoader = new DefaultResourceLoader();
        Resource resource = resourceLoader.getResource("classpath:jflow.properties");
        propertyConfigurer.setLocation(resource);
        return propertyConfigurer;
    }*/

    /**
     * 配置JFlow数据库属性
     */
    public void loadJFlowDatabaseConfig() {
        //配置jflow属性
        Hashtable<String, Object> props = SystemConfig.getCS_AppSettings();

        String url = env.getProperty("spring.datasource.druid.master.url");

        String platform = "MySQL";
        String schema = env.getProperty("spring.datasource.druid.master.datasource");
        String username = env.getProperty("spring.datasource.druid.master.username");
        String password = env.getProperty("spring.datasource.druid.master.password");
        String testQuery = env.getProperty("spring.datasource.druid.master.connection-test-query");
        props.put("AppCenterDSN", url);
        props.put("AppCenterDBType", platform);
        props.put("AppCenterDBDatabase", schema);
        props.put("JflowUser", username);
        props.put("JflowPassword", password);
        props.put("JflowTestSql", testQuery);
        props.put("RedisIsEnable",env.getProperty("Jflow.spring.data.redis.repositories.enabled").equals("true")?1:0);
    }



    /**
     * JFlow集成上下文工具类
     * @param dataSource 数据源
     * @return
     */
    @Primary
    @Bean
    public ContextHolderUtils jflowContextHolderUtils(DataSource dataSource) {
        loadJFlowDatabaseConfig();
        ContextHolderUtils contextHolderUtils = new ContextHolderUtils();
        contextHolderUtils.setDataSource(dataSource);
        if(applicationContext != null) {
            contextHolderUtils.setApplicationContext(applicationContext);
        }

        return contextHolderUtils;
    }
    /**
     * JFlow集成上下文工具类
     * @param redisUtils  redis
     * @return
     */
    @Bean
    @ConditionalOnProperty(name="spring.data.redis.repositories.enabled", havingValue="true", matchIfMissing=false)
    public ContextHolderUtils jflowRedisContextHolderUtils(RedisUtils redisUtils) {
        ContextHolderUtils contextHolderUtils = new ContextHolderUtils();
        contextHolderUtils.setRedisUtils(redisUtils);
        if(applicationContext != null) {
            contextHolderUtils.setApplicationContext(applicationContext);
        }
        return contextHolderUtils;
    }


    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static void setApplicationContext(ApplicationContext applicationContext) {
        JFlowConfig.applicationContext = applicationContext;
    }

}
