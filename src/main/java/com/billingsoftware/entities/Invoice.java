package com.billingsoftware.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "invoice")
public class Invoice {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "invoice_id")
	private Long invoiceId;

	@Column(name = "product_name")
	private String productName;

	@Column(name = "hsn_bac")
	private String hsnBac;

	@Column(name = "product_price")
	private Double productPrice;

	@Column(name = "product_sgst")
	private String productSGST;

	@Column(name = "product_cgst")
	private String productCGST;

	@Column(name = "product_quantity")
	private Integer productQuantity;

	@Column(name = "product_rate")
	private Double productRate;

	@Column(name = "customer_id")
	private Long customerId;

	@Column(name = "invoice_number")
	private String invoiceNumber;

	@Column(name = "order_date")
	private String orderDate;

	public Invoice() {

	}

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

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public Double getProductRate() {
		return productRate;
	}

	public void setProductRate(Double productRate) {
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

}
