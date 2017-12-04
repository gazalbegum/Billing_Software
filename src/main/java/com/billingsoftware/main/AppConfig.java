package com.billingsoftware.main;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.hibernate.SessionFactory;
import com.billingsoftware.dao.CustomerDao;
import com.billingsoftware.daoimpl.CustomerDaoImpl;
import com.billingsoftware.service.CustomerService;
import com.billingsoftware.serviceimpl.CustomerServiceImpl;


public class AppConfig {

	@Bean
	public CustomerService getCustomerService(){
		return new CustomerServiceImpl();
	}
	
	@Bean
	public CustomerDao getCustomerDao(){
		return new CustomerDaoImpl();
	}
	
	/*public SessionFactory getSessionFactory(){
		return buildSessionFactory();
	}*/
	
	
}
