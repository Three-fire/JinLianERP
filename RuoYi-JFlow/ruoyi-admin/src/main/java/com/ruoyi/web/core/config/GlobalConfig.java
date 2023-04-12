package com.ruoyi.web.core.config;

import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.io.File;

@Configuration
public class GlobalConfig {
    @Bean
    public WebServerFactoryCustomizer<TomcatServletWebServerFactory> customizer() {
        return (factory) -> { factory.addContextCustomizers((context) -> {
            //模块中webapp相对路径
            String relativePath = "ruoyi-admin/src/main/webapp";
            File docBaseFile = new File(relativePath);
            // 路径是否存在
            if (docBaseFile.exists()) {
                context.setDocBase(docBaseFile.getAbsolutePath());
            }
        });
        };
    }
}
