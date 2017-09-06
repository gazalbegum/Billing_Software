package com.billingsoftware.utils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.beans.InvoiceBean;
import com.billingsoftware.beans.LoginBean;
import com.billingsoftware.beans.ProductBean;

public class RequestUtil {
	
	public static List<InvoiceBean> invoiceBeanList = new ArrayList<InvoiceBean>();
	
	public static ProductBean setProductRequestToBean(HttpServletRequest request) {

		ProductBean productBean = new ProductBean();

		String productName = request.getParameter("product_name");
		String productHsnBac = request.getParameter("product_hsn_bac");
		String productSGST = request.getParameter("product_sgst");
		String productCGST = request.getParameter("product_cgst");

        productBean.setProductSGST(productSGST);
        productBean.setProductCGST(productCGST);
        productBean.setProductHsnBac(productHsnBac);
        productBean.setProductName(productName);

		return productBean;
	}

	public static CustomerBean setCustomerRequestToBean(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		CustomerBean customerBean = new CustomerBean();
		
		String customerName = request.getParameter("customer_name");
		String provisionID = request.getParameter("customer_provisional_id");
		String customerAddress = request.getParameter("customer_address");
		String customerPhone = request.getParameter("customer_phone");
		String customerEmailId = request.getParameter("customer_email_id");
		String customerPaymentMode = request.getParameter("customer_payment_mode");
		String customerCompanyName = request.getParameter("customer_company_name");		
	
		customerBean.setCustomerAddress(customerAddress);
		customerBean.setCustomerCompanyName(customerCompanyName);
		customerBean.setCustomerEmailId(customerEmailId);
		customerBean.setCustomerName(customerName);
		customerBean.setProvisionID(provisionID);
		customerBean.setCustomerPaymentMode(customerPaymentMode);
		customerBean.setCustomerPhone(customerPhone);
		
		return customerBean;
	}

	public static InvoiceBean setInvoiceRequestToBean(HttpServletRequest request,  Map<Integer,String> productMap) {
		// TODO Auto-generated method stub
		
		System.out.println("InvoiceBean setInvoiceRequestToBean(HttpServletRequest request,  Map<Integer,String> productMap) : productMap" +productMap);
		InvoiceBean invoiceBean = new InvoiceBean();

		String customerId = request.getParameter("customer_id");
		String productName = request.getParameter("product_name");
		String productHsnBac = request.getParameter("product_hsn_bac");
		//String priceAfterGST = request.getParameter("price_after_gst");
		String productSGST = request.getParameter("product_sgst");
		String productCGST = request.getParameter("product_cgst");
		String unitPrice = request.getParameter("unit_price");
		String productQuantity = request.getParameter("product_quantity");
		String netPrice = request.getParameter("net_price");
		String orderDate = request.getParameter("order_date");
		System.out.println("orderDate" +orderDate);
		System.out.println("customer id : " +customerId);
		
		//String productId = productName;
		invoiceBean.setCustomerId(Long.parseLong(customerId));
		invoiceBean.setHsnBac(productHsnBac);
		//invoiceBean.setPriceAfterGst(Double.parseDouble(priceAfterGST));
		invoiceBean.setProductSGST(productSGST);
		invoiceBean.setProductCGST(productCGST);
		invoiceBean.setProductName(productMap.get(Integer.parseInt(productName)));
		invoiceBean.setProductPrice(unitPrice);
		invoiceBean.setProductQuantity(Integer.parseInt(productQuantity));
		invoiceBean.setProductRate(netPrice);		
		invoiceBean.setOrderDate(CommonUtils.convertToFormatDDMMYYYY(orderDate));
		
		invoiceBeanList.add(invoiceBean);
		
		System.out.println("invoiceBeanList :" +invoiceBeanList);
		
		return invoiceBean;
	}

	public static LoginBean setLoginRequestToBean(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		LoginBean loginBean = new LoginBean();
		
		String userName = request.getParameter("user_name");
		String password = request.getParameter("password");
		
		loginBean.setUserName(userName);
		loginBean.setPassword(password);
		
		return loginBean;
		
	}

	public static InvoiceBean setUpdateInvoiceRequestToBean(HttpServletRequest request) {
		InvoiceBean invoiceBean = new InvoiceBean();

		//String customerId = request.getParameter("customer_id");
		String productName = request.getParameter("product_name");
		String productHsnBac = request.getParameter("hsn_bac");
		//String priceAfterGST = request.getParameter("price_after_gst");
		String productSGST = request.getParameter("product_sgst");
		String productCGST = request.getParameter("product_cgst");
		String unitPrice = request.getParameter("product_price");
		String productQuantity = request.getParameter("product_quantity");
		String netPrice = request.getParameter("product_rate");
		//String orderDate = request.getParameter("order_date");
		String invoiceId = request.getParameter("invoice_id");
		
		//invoiceBean.setCustomerId(Long.parseLong(customerId));
		invoiceBean.setHsnBac(productHsnBac);
		//invoiceBean.setPriceAfterGst(Double.parseDouble(priceAfterGST));
		invoiceBean.setProductSGST(productSGST);
		invoiceBean.setProductCGST(productCGST);
		invoiceBean.setProductName(productName);
		invoiceBean.setProductPrice(unitPrice);
		invoiceBean.setProductQuantity(Integer.parseInt(productQuantity));
		invoiceBean.setProductRate(netPrice);	
		invoiceBean.setInvoiceId(Long.parseLong(invoiceId));
		//invoiceBean.setOrderDate(orderDate);
		
		return invoiceBean;
	}

	public static ProductBean setUpdateProductRequestToBean(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		ProductBean productBean = new ProductBean();
		
		String productId = request.getParameter("product_id");
		String productName = request.getParameter("product_name");
		String productHsnBac = request.getParameter("hsn_bac");
		String productSGST = request.getParameter("product_sgst");
		String productCGST = request.getParameter("product_cgst");
		
		productBean.setProductId(Long.parseLong(productId));
		productBean.setProductName(productName);
		productBean.setProductHsnBac(productHsnBac);
		productBean.setProductSGST(productSGST);
		productBean.setProductCGST(productCGST);
		
		return productBean;
	}
}
