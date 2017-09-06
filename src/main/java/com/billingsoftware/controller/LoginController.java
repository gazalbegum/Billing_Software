package com.billingsoftware.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.billingsoftware.beans.LoginBean;
import com.billingsoftware.utils.RequestUtil;

@Controller("/login")
public class LoginController {

	@RequestMapping(value = "/validateLogin")
	public String validateLogin(ModelMap model, HttpServletRequest request){		
		
		LoginBean loginBean = RequestUtil.setLoginRequestToBean(request);
		
		String landingPage = "add_product_billing";//returnView(loginBean);
		
		model.addAttribute("failMessage","Please enter valid credentials");
	
		return landingPage;
	}
	
	
	private String returnView(LoginBean loginBean){
		
		String landingPage = "";
	  	if("admin".equals(loginBean.getUserName())){
	  		System.out.println("admin");
			landingPage = "add_master_customer";		    
		}else{
			landingPage = "login";
		}
	  	System.out.println("landingPage :" +landingPage);
	  	return landingPage;
	}
}
