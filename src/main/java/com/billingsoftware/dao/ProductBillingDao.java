package com.billingsoftware.dao;

import java.util.List;

import com.billingsoftware.beans.BillingHistoryBean;
import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.entities.Invoice;

public interface ProductBillingDao {

	public void addProduct(List<Invoice> invoices);
	
	public void editProduct(Invoice invoice);
	
	public void deleteProduct(String invoiceId);
	
	public List<Invoice> getProducts(String invoiceNumber);	
	
	public String getLastInvoiceNumber();
	
	public CustomerBean getFinalInvoiceDetails();
	
	public List<BillingHistoryBean> getBillingHistory();
	
}
