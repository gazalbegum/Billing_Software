package com.billingsoftware.utils;

import java.util.ArrayList;
import java.util.List;

import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.beans.InvoiceBean;
import com.billingsoftware.beans.ProductBean;
import com.billingsoftware.entities.Customer;
import com.billingsoftware.entities.Invoice;
import com.billingsoftware.entities.Product;

public class BeanUtil {

	public static List<InvoiceBean> setInvoiceEntitiesToBeans(List<Invoice> invoices) {
		// TODO Auto-generated method stub
		
		InvoiceBean invoiceBean = null;
        
		List<InvoiceBean> invoiceBeans = new ArrayList<InvoiceBean>();

		for (Invoice tempInvoice : invoices) {

			invoiceBean = new InvoiceBean();

			invoiceBean.setHsnBac(tempInvoice.getHsnBac());
			invoiceBean.setInvoiceId(tempInvoice.getInvoiceId());
			//invoiceBean.setPriceAfterGst(tempInvoice.getPriceAfterGst());
			invoiceBean.setProductSGST(tempInvoice.getProductSGST());
			invoiceBean.setProductCGST(tempInvoice.getProductCGST());
			invoiceBean.setProductName(tempInvoice.getProductName());
			invoiceBean.setProductPrice(CommonUtils.convertToTwoDecimalPlaces(tempInvoice.getProductPrice()));
			invoiceBean.setProductQuantity(tempInvoice.getProductQuantity());
			invoiceBean.setProductRate(CommonUtils.convertToTwoDecimalPlaces(tempInvoice.getProductRate()));
            invoiceBean.setCustomerId(tempInvoice.getCustomerId());
            invoiceBean.setInvoiceNumber(tempInvoice.getInvoiceNumber());
            
            // added 2 new fields
            invoiceBean.setChallanNumber(tempInvoice.getChallanNumber());
            invoiceBean.setPurchaseOrder(tempInvoice.getPurchaseOrder());
            
            invoiceBean.setOrderDate(tempInvoice.getOrderDate());
            invoiceBean.setCustomerPaymentMode(tempInvoice.getCustomerPaymentMode());
            // calculate for bill extra fields
            invoiceBean.setTotalPrice(CommonUtils.convertToTwoDecimalPlaces(tempInvoice.getProductPrice() * tempInvoice.getProductQuantity()));
            invoiceBean.setPriceAfterCGST(CommonUtils.convertToTwoDecimalPlaces((Double.parseDouble(tempInvoice.getProductCGST()) / 100) * tempInvoice.getProductPrice() * tempInvoice.getProductQuantity()));
            invoiceBean.setPriceAfterSGST(CommonUtils.convertToTwoDecimalPlaces((Double.parseDouble(tempInvoice.getProductSGST()) / 100) * tempInvoice.getProductPrice() * tempInvoice.getProductQuantity()));
    		
            //System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: " +CommonUtils.convertToTwoDecimalPlaces(invoiceBean.getPriceAfterCGST()));
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: " +invoiceBean.getPriceAfterSGST());
            System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: " +invoiceBean.getTotalPrice());
			invoiceBeans.add(invoiceBean);

		}
		return invoiceBeans;

	}

	public static Customer setCustomerBeanToEntity(CustomerBean customerBean) {
		// TODO Auto-generated method stub
		
		Customer customer = new Customer();
		
		customer.setCustomerAddress(customerBean.getCustomerAddress());
		customer.setcustomerGstIn(customerBean.getcustomerGstIn());
		customer.setCustomerEmailId(customerBean.getCustomerEmailId());
		customer.setCustomerId(customerBean.getCustomerId());
		customer.setCustomerName(customerBean.getCustomerName());
		customer.setCustomerPhone(customerBean.getCustomerPhone());
		
		return customer;
	}

	public static List<CustomerBean> setCustomerEntitiesToBeans(List<Customer> customers) {
		// TODO Auto-generated method stub
		
		CustomerBean customerBean = null;
		
		List<CustomerBean> customerBeans = new ArrayList<CustomerBean>();
		
		for(Customer tempCustomer : customers){
			
			customerBean = new CustomerBean();
			
			customerBean.setCustomerAddress(tempCustomer.getCustomerAddress());
			customerBean.setcustomerGstIn(tempCustomer.getcustomerGstIn());
			customerBean.setCustomerEmailId(tempCustomer.getCustomerEmailId());
			customerBean.setCustomerId(tempCustomer.getCustomerId());
			customerBean.setCustomerName(tempCustomer.getCustomerName());
			customerBean.setCustomerPhone(tempCustomer.getCustomerPhone());
			
			customerBeans.add(customerBean);
		}
				
		return customerBeans;
	}

	public static Invoice setInvoiceBeanToEntity(InvoiceBean invoiceBean) {
		// TODO Auto-generated method stub
		// CGST  SGST
		Invoice invoice = new Invoice();
		
		invoice.setCustomerId(invoiceBean.getCustomerId());
		invoice.setHsnBac(invoiceBean.getHsnBac());
		invoice.setInvoiceId(invoiceBean.getInvoiceId());
		//invoice.setPriceAfterGst(invoiceBean.getPriceAfterGst());
		invoice.setProductSGST(invoiceBean.getProductSGST());
		invoice.setProductCGST(invoiceBean.getProductCGST());
		invoice.setProductName(invoiceBean.getProductName());
		invoice.setProductPrice(Double.parseDouble(invoiceBean.getProductPrice()));
		invoice.setProductQuantity(invoiceBean.getProductQuantity());
		invoice.setProductRate(Double.parseDouble(invoiceBean.getProductRate()));
		invoice.setOrderDate(invoiceBean.getOrderDate());
		invoice.setCustomerPaymentMode(invoiceBean.getCustomerPaymentMode());
		
		// new fields added
		invoice.setChallanNumber(invoiceBean.getChallanNumber());
		invoice.setPurchaseOrder(invoiceBean.getPurchaseOrder());
		invoice.setInvoiceNumber(invoiceBean.getInvoiceNumber());
		return invoice;
	}

	public static Product setProductBeanToEntity(ProductBean productBean) {
		// TODO Auto-generated method stub
		
		Product product = new Product();
		
		product.setProductSGST(productBean.getProductSGST());
		product.setProductCGST(productBean.getProductCGST());
		product.setProductHsnBac(productBean.getProductHsnBac());
		product.setProductId(productBean.getProductId());
		product.setProductName(productBean.getProductName());
		
		return product;
	}

	public static List<Invoice> setInvoiceBeansToEntities(List<InvoiceBean> invoiceBeans) {
		// TODO Auto-generated method stub
		
		List<Invoice> invoices = new ArrayList<Invoice>();
		
		Invoice invoice = null;
		
		for(InvoiceBean tempInvoiceBean : invoiceBeans){
		    invoice = new Invoice();
		    
		    invoice.setCustomerId(tempInvoiceBean.getCustomerId());
		    invoice.setHsnBac(tempInvoiceBean.getHsnBac());
		    invoice.setInvoiceId(tempInvoiceBean.getInvoiceId());
		    //invoice.setInvoiceNumber(tempInvoiceBean.get);
		    //invoice.setPriceAfterGst(tempInvoiceBean.getPriceAfterGst());
		    invoice.setProductSGST(tempInvoiceBean.getProductSGST());
		    invoice.setProductCGST(tempInvoiceBean.getProductCGST());
		    invoice.setProductName(tempInvoiceBean.getProductName());
		    invoice.setProductPrice(Double.parseDouble(tempInvoiceBean.getProductPrice()));
		    invoice.setProductQuantity(tempInvoiceBean.getProductQuantity());
		    invoice.setProductRate(Double.parseDouble(tempInvoiceBean.getProductRate()));
		    invoice.setOrderDate(tempInvoiceBean.getOrderDate());
		    invoice.setCustomerPaymentMode(tempInvoiceBean.getCustomerPaymentMode());
		    
		    // added 2 new fields 
		    invoice.setChallanNumber(tempInvoiceBean.getChallanNumber());
		    invoice.setPurchaseOrder(tempInvoiceBean.getPurchaseOrder());
		    
		    invoices.add(invoice);
		    
		}
		
		return invoices;
		
	}

	public static CustomerBean setCustomerEntityToBean(Customer customer) {
		// TODO Auto-generated method stub
		
		CustomerBean customerBean = new CustomerBean();
		
		customerBean.setCustomerAddress(customer.getCustomerAddress());
		customerBean.setCustomerEmailId(customer.getCustomerEmailId());
		customerBean.setCustomerId(customer.getCustomerId());
		customerBean.setCustomerName(customer.getCustomerName());
		customerBean.setcustomerGstIn(customer.getcustomerGstIn());
		customerBean.setCustomerPhone(customer.getCustomerPhone());
		
		return customerBean;
	}

	public static List<ProductBean> setEntitesToProductBean(List<Product> products) {
		// TODO Auto-generated method stub
		List<ProductBean> productBeans = new ArrayList<ProductBean>();
		
		ProductBean productBean = null;
		
		if(products != null && products.size() > 0){
			for(Product tempProduct : products){
				productBean = new ProductBean();
				productBean.setProductId(tempProduct.getProductId());
				productBean.setProductName(tempProduct.getProductName());
				productBean.setProductSGST(tempProduct.getProductSGST());
				productBean.setProductCGST(tempProduct.getProductCGST());
				productBean.setProductHsnBac(tempProduct.getProductHsnBac());
				productBeans.add(productBean);
			}
		}				
		return productBeans;
	}

	public static ProductBean setEntityToProductBean(Product product) {
		// TODO Auto-generated method stub
		
		ProductBean productBean = new ProductBean();
		
		if(product != null){
			productBean.setProductId(product.getProductId());
			productBean.setProductName(product.getProductName());
			productBean.setProductSGST(product.getProductSGST());
			productBean.setProductCGST(product.getProductCGST());
			productBean.setProductHsnBac(product.getProductHsnBac());
		}		
		
		return productBean;
	}

}
