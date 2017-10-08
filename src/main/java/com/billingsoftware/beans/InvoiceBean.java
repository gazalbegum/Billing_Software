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
	
	private String customerPaymentMode;
	
	
	// variables added to display calculated values
	
	private String totalPrice;
	
	private String priceAfterSGST;
	
	private String priceAfterCGST;
	
	
	// new fields added
	
	private String challanNumber;
	
	private String purchaseOrder;
	
	private String purchaseDate;
	
	private String challanDate;

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
	
	public String getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public String getChallanDate() {
		return challanDate;
	}

	public void setChallanDate(String challanDate) {
		this.challanDate = challanDate;
	}

	@Override
	public String toString() {
		return "InvoiceBean [invoiceId=" + invoiceId + ", customerId=" + customerId + ", productName=" + productName
				+ ", hsnBac=" + hsnBac + ", productPrice=" + productPrice + ", productSGST=" + productSGST
				+ ", productCGST=" + productCGST + ", productQuantity=" + productQuantity + ", productRate="
				+ productRate + ", invoiceNumber=" + invoiceNumber + ", orderDate=" + orderDate
				+ ", customerPaymentMode=" + customerPaymentMode + ", totalPrice=" + totalPrice + ", priceAfterSGST="
				+ priceAfterSGST + ", priceAfterCGST=" + priceAfterCGST + ", challanNumber=" + challanNumber
				+ ", purchaseOrder=" + purchaseOrder + ", purchaseDate=" + purchaseDate + ", challanDate="
				+ challanDate + "]";
	}

	
	
	
}
