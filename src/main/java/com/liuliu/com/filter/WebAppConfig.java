package com.liuliu.com.filter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebAppConfig implements WebMvcConfigurer {
	
	//注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new UserFilter()).addPathPatterns("/user/**");
        registry.addInterceptor(new SystemAdminFilter()).addPathPatterns("/admin/**");
        registry.addInterceptor(new ProductFilter()).addPathPatterns("/product/**","/ueditor/**");
    }
}
