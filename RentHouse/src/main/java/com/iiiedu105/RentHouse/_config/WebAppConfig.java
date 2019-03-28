package com.iiiedu105.RentHouse._config;

import javax.servlet.ServletContext;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
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
		resolver.setPrefix("/WEB-INF/views/");//EX: /WEB-INF/views/ + ??????
		resolver.setSuffix(".jsp");//EX: ???? + .jsp
		return resolver;
	}	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/HouseResorce/**").addResourceLocations("/WEB-INF/views/House/");
		registry.addResourceHandler("/RHstaticresource/**")
		.addResourceLocations("/WEB-INF/views/backstage/RHstaticresource/");
		registry.addResourceHandler("/login/**").addResourceLocations("/WEB-INF/views/login/");
		registry.addResourceHandler("/search/**").addResourceLocations("/WEB-INF/views/search/");
		registry.addResourceHandler("/deal/**").addResourceLocations("/WEB-INF/views/deal/");
		registry.addResourceHandler("/Forum/**").addResourceLocations("/WEB-INF/views/Forum/");
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver =new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;		
	}
	
//	public ViewResolver pdfViewResolver(ServletContext context) {
//		return new PdfViewResolver(context);
//	}
}