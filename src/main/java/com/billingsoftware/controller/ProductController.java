package com.billingsoftware.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.billingsoftware.beans.ProductBean;
import com.billingsoftware.service.ProductService;
import com.billingsoftware.utils.RequestUtil;

@Controller("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/addProduct")
	public String addProduct(ModelMap model, HttpServletRequest request){
		
		ProductBean productBean = RequestUtil.setProductRequestToBean(request);
		
        productService.addProduct(productBean);
		
		return "add_master_product";
	}
	
	@RequestMapping(value = "updateProduct")
	public String updateProduct(ModelMap model, HttpServletRequest request){	
		System.out.println("in update product method");
		ProductBean productBean = RequestUtil.setUpdateProductRequestToBean(request);		
		productService.editProduct(productBean);	
		return "verify_product";
	}
	
	@RequestMapping(value = "deleteProduct")
	public String deleteProduct(ModelMap model, HttpServletRequest request){		
		String productId = request.getParameter("name");
		productService.deleteProduct(productId);				
		return "verify_product";
	}
	
	@RequestMapping(value = "/getProducts")
	public String getCustomers(ModelMap model){
		System.out.println("in getProducts ethod");
		List<ProductBean> productBeans = productService.getProducts();    
		System.out.println("GET PRODUCTS :" +productBeans);
		model.addAttribute("productBeans", productBeans);
		return "edit_delete_product";
	}
	
	@RequestMapping(value = "getProductsById")
	public  @ResponseBody ProductBean getProductById(ModelMap model, HttpServletRequest request){		
		String productId = request.getParameter("name");
		ProductBean productBean = productService.getProductById(productId); 
		return productBean;
	}
	// 
}
