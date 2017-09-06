package com.billingsoftware.beans;

public class InvoiceBean {

	private Long invoiceId;

	private Long customerId;

	private String productName;

	private String hsnBac;

	private String productPrice;

	private String productSGST;

	private String productCGST;

	private Integer productQuantity;

	private String productRate;

	private String invoiceNumber;

	private String orderDate;
	
	
	// variables added to display calculated values
	
	private String totalPrice;
	
	private String priceAfterSGST;
	
	private String priceAfterCGST;

	public Long getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Long invoiceId) {
		this.invoiceId = invoiceId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getHsnBac() {
		return hsnBac;
	}

	public void setHsnBac(String hsnBac) {
		this.hsnBac = hsnBac;
	}

	public String getProductSGST() {
		return productSGST;
	}

	public void setProductSGST(String productSGST) {
		this.productSGST = productSGST;
	}

	public String getProductCGST() {
		return productCGST;
	}

	public void setProductCGST(String productCGST) {
		this.productCGST = productCGST;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getProductRate() {
		return productRate;
	}

	public void setProductRate(String productRate) {
		this.productRate = productRate;
	}

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

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPriceAfterSGST() {
		return priceAfterSGST;
	}

	public void setPriceAfterSGST(String priceAfterSGST) {
		this.priceAfterSGST = priceAfterSGST;
	}

	public String getPriceAfterCGST() {
		return priceAfterCGST;
	}

	public void setPriceAfterCGST(String priceAfterCGST) {
		this.priceAfterCGST = priceAfterCGST;
	}

}
