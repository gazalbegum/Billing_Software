package com.billingsoftware.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.billingsoftware.beans.BillingHistoryBean;
import com.billingsoftware.beans.FinalInvoiceBean;
import com.billingsoftware.beans.InvoiceBean;
import com.billingsoftware.helpers.BeanHelper;
import com.billingsoftware.service.CustomerService;
import com.billingsoftware.service.ProductBillingService;
import com.billingsoftware.service.ProductService;
import com.billingsoftware.utils.CommonUtils;
import com.billingsoftware.utils.RequestUtil;

@Controller("/billingInvoice")
public class BillingInvoiceController {

	@Autowired
	private ProductBillingService productBillingService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BeanHelper beanHelper;
	
	private Map<Integer,String> productMap;
	
	@RequestMapping(value = "/getProductsForVerify")
	public String getProductsForVerify(ModelMap model){	
		
		productBillingService.addProduct();  // Need to delete this line and test  
		String invoiceNumber = null;
		List<InvoiceBean> invoiceBeans = productBillingService.getProducts(invoiceNumber);         
		model.addAttribute("invoiceBeans", invoiceBeans);					
		return "verify_product";
	}
	
	@RequestMapping(value = "/getBillingHistory")
	public String getBillingHistory(ModelMap model){	
		
		List<BillingHistoryBean> billingHistoryBeans = productBillingService.getBillingHistory();  
		Collections.sort(billingHistoryBeans, new Comparator<BillingHistoryBean>() {

			@Override
			public int compare(BillingHistoryBean bean1, BillingHistoryBean bean2) {
				// TODO Auto-generated method stub
				
				String dateString1 = bean1.getOrderDate();
				String dateString2 = bean2.getOrderDate();
				
				Date dateBean1 = CommonUtils.convertToFormatDDMMYYYYDate(dateString1);
				Date dateBean2 = CommonUtils.convertToFormatDDMMYYYYDate(dateString2);
				
				return dateBean1.compareTo(dateBean2);
				
//				String [] strArr_1 = bean1.getInvoiceNumber().split("-");
//				int number_1 = Integer.parseInt(strArr_1[1]);
//				
//				String [] strArr_2 = bean1.getInvoiceNumber().split("-");
//				int number_2 = Integer.parseInt(strArr_2[1]);
//				
//				return number_1 - number_2;
			}
			
			
		});
		model.addAttribute("billingHistoryBeans", billingHistoryBeans);	
		return "billing_history";
	}
	
	@RequestMapping(value = "/getProductsForInvoice")
	public String getProductsForInvoices(ModelMap model, HttpServletRequest request){	
	    String invoiceNumber = request.getParameter("invoice_number");
        List<InvoiceBean> invoiceBeans = productBillingService.getProducts(invoiceNumber);         
        System.out.println("public String getProductsForInvoices(ModelMap model) :" +invoiceBeans);       
        FinalInvoiceBean finalInvoiceBean = beanHelper.getDataForFinalInvoiceBean(invoiceBeans);
       	model.addAttribute("invoiceBeans", invoiceBeans);
		model.addAttribute("finalInvoiceBean", finalInvoiceBean);	
		return "invoice_1";
	}	

	@RequestMapping(value = "/addProductForBilling")
	public String addProduct(ModelMap model, HttpServletRequest request){	
		System.out.println("addProduct" +productMap);
		RequestUtil.setInvoiceRequestToBean(request, productMap);			
		return "add_product_billing";
	}
	
	@RequestMapping(value = "/updateProductForBilling")
	public String updateProduct(ModelMap model, HttpServletRequest request){	
		
		InvoiceBean invoiceBean = RequestUtil.setUpdateInvoiceRequestToBean(request);	
		
		System.out.println("UPDATE INVOICE BEAN :" +invoiceBean);
		productBillingService.editProduct(invoiceBean);		
		return "verify_product";
	}
	
	@RequestMapping(value = "/deleteProductForBilling")
	public String deleteProduct(ModelMap model, HttpServletRequest request){		
		String invoiceId = request.getParameter("name");
		productBillingService.deleteProduct(invoiceId);			
		return "verify_product";
	}
		
	
	@RequestMapping("/customerMap")
	public @ResponseBody Map<Integer, String> getCustomerMap(ModelMap model, HttpServletRequest request){		
		return beanHelper.getCustomerMap();
	}	
	
	@RequestMapping("/productMap")
	public @ResponseBody Map<Integer, String> getProductMap(ModelMap model, HttpServletRequest request){
		productMap = beanHelper.getProductMap();
		return productMap;
	}
	

	@RequestMapping(value = "/jsp/deleteInvoice")
	public String deleteInvoice(ModelMap model, HttpServletRequest request){		
		String invoiceId = request.getParameter("name");
		productBillingService.deleteProduct(invoiceId);			
		return "billing_history";
	}
	
	
}



