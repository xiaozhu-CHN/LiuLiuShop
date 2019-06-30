package com.liuliu.com.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class PicConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/imgs/user/**").addResourceLocations("file:C:/APP/java/spring boot/eclipse-workspace/liuliu/src/main/resources/static/imgs/user/");
		registry.addResourceHandler("/imgs/property/**").addResourceLocations("file:C:/APP/java/spring boot/eclipse-workspace/liuliu/src/main/resources/static/imgs/property/");
		registry.addResourceHandler("/imgs/proimg/**").addResourceLocations("file:C:/APP/java/spring boot/eclipse-workspace/liuliu/src/main/resources/static/imgs/proimg/");
		registry.addResourceHandler("/imgs/product/**").addResourceLocations("file:C:/APP/java/spring boot/eclipse-workspace/liuliu/src/main/resources/static/imgs/product/");
		registry.addResourceHandler("/imgs/introduce/**").addResourceLocations("file:C:/APP/java/spring boot/eclipse-workspace/liuliu/src/main/resources/static/imgs/introduce/");
	}
}