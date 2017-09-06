package com.billingsoftware.beans;

import java.math.BigDecimal;

public class BillingHistoryBean {

	private String customerName;
	
	private String orderDate;
	
	private String invoiceNumber;
	
	private BigDecimal totalPrice;

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}
	
	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "BillingHistoryBean [customerName=" + customerName + ", orderDate=" + orderDate + ", invoiceNumber="
				+ invoiceNumber + ", totalPrice=" + totalPrice + "]";
	}
	
	
	
}
