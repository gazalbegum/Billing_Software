package com.billingsoftware.beans;


public class FinalInvoiceBean {

	private String invoiceNumber;
	
	private String orderDate;
	
	private CustomerBean customerBean;	
	
	private String totalCGST;
	
	private String totalSGST;
	
	private String netPrice;
	
	private String totalPrice;
	
	private String customerPaymentMode;
	
	private String amountInWords;
	
	private String challanNumber;
	
	private String purchaseOrder;

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

	public String getAmountInWords() {
		return amountInWords;
	}

	public void setAmountInWords(String amountInWords) {
		this.amountInWords = amountInWords;
	}

	public String getCustomerPaymentMode() {
		return customerPaymentMode;
	}

	public void setCustomerPaymentMode(String customerPaymentMode) {
		this.customerPaymentMode = customerPaymentMode;
	}

	public String getChallanNumber() {
		return challanNumber;
	}

	public void setChallanNumber(String challanNumber) {
		this.challanNumber = challanNumber;
	}

	public String getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(String purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}		
	
	
}
