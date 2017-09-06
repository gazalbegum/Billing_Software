package com.billingsoftware.beans;


public class FinalInvoiceBean {

	private String invoiceNumber;
	
	private String orderDate;
	
	private CustomerBean customerBean;	
	
	private String totalCGST;
	
	private String totalSGST;
	
	private String netPrice;
	
	private String totalPrice;

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public CustomerBean getCustomerBean() {
		return customerBean;
	}

	public void setCustomerBean(CustomerBean customerBean) {
		this.customerBean = customerBean;
	}

	public String getTotalCGST() {
		return totalCGST;
	}

	public void setTotalCGST(String totalCGST) {
		this.totalCGST = totalCGST;
	}

	public String getTotalSGST() {
		return totalSGST;
	}

	public void setTotalSGST(String totalSGST) {
		this.totalSGST = totalSGST;
	}

	public String getNetPrice() {
		return netPrice;
	}

	public void setNetPrice(String netPrice) {
		this.netPrice = netPrice;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

		
	
}
