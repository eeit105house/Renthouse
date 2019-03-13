package com.iiiedu105.RentHouse._config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan("com.iiiedu105")
public class WebAppConfig extends WebMvcConfigurerAdapter {


	public WebAppConfig() {
	}

	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/views/backstage/");//EX: /WEB-INF/views/ + ??????
		resolver.setSuffix(".jsp");//EX: ???? + .jsp
		return resolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry rhr) {
			rhr.addResourceHandler("/RHstaticresource/**")
			.addResourceLocations("/WEB-INF/views/backstage/RHstaticresource/");
//			rhr.addResourceHandler("/font/**")
//			.addResourceLocations("/WEB-INF/views/backstage/font/");
//			rhr.addResourceHandler("/ico/**")
//			.addResourceLocations("/WEB-INF/views/backstage/ico/");
//			rhr.addResourceHandler("/img/**")
//			.addResourceLocations("/WEB-INF/views/backstage/img/");
//			rhr.addResourceHandler("/js/**")
//			.addResourceLocations("/WEB-INF/views/backstage/js/");				
	}
	
	
}

