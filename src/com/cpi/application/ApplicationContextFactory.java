package com.cpi.application;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextFactory {
	
	private static ApplicationContextFactory factory = null;
	
	private ApplicationContext applicationContext;
	
	private ApplicationContextFactory() {
		applicationContext = new ClassPathXmlApplicationContext("/com/cpi/resource/applicationContext.xml");
	}
	
	public static ApplicationContextFactory getInstance() {
		if(factory == null) {
			factory = new ApplicationContextFactory();
		}
		
		return factory;
	}
	
	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}
}
