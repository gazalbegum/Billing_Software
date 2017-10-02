package com.billingsoftware.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.service.CustomerService;
import com.billingsoftware.utils.RequestUtil;

@Controller("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/addCustomer")
	public String addCustomer(ModelMap model, HttpServletRequest request){
		
		CustomerBean customerBean = RequestUtil.setCustomerRequestToBean(request,"add");
		
		customerService.addCustomer(customerBean);
		
		return "add_master_customer";
	}
	
	
	@RequestMapping(value = "/updateCustomerDetails")
	public String updateCustomer(ModelMap model, HttpServletRequest request){	
		System.out.println("in update product method");
		CustomerBean customerBean = RequestUtil.setCustomerRequestToBean(request,"update");	
		System.out.println("Customer Bean :" +customerBean);
		customerService.editCustomer(customerBean);
		//List<CustomerBean> customerBeans = customerService.getCustomers();        
		//model.addAttribute("customerBeans", customerBeans);
		return "edit_delete_cutomer";
	}
	
	@RequestMapping(value = "/jsp/deleteCustomerDetails")
	public String deleteCustomer(ModelMap model, HttpServletRequest request){		
		String customerId = request.getParameter("name");
		System.out.println("CUSTOMER ID :" +customerId);
		customerService.deleteCustomer(customerId);				
		return "verify_product";
	}
	
	@RequestMapping(value = "/getCustomers")
	public String getCustomers(ModelMap model){
		System.out.println("in getcustomers ethod");
		List<CustomerBean> customerBeans = customerService.getCustomers();     
		System.out.println("GET CUSTOMERS :" +customerBeans);
		model.addAttribute("customerBeans", customerBeans);
		return "edit_delete_customer";
	}
}
