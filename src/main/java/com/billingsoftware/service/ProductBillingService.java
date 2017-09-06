package com.billingsoftware.service;

import java.util.List;

import com.billingsoftware.beans.BillingHistoryBean;
import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.beans.InvoiceBean;

public interface ProductBillingService {

	public void addProduct();
	
	public void editProduct(InvoiceBean invoiceBean);
	
	public void deleteProduct(String invoiceId);
	
	public List<InvoiceBean> getProducts(String invoiceNumber);
	
	public CustomerBean getFinalInvoiceDetails();
	
	public List<BillingHistoryBean> getBillingHistory();
}
