package com.billingsoftware.beans;

public class ProductBeanDuplicate {



	private Long productId;

	private String productName;

	private String productSGST;

	private String productCGST;

	private String productHsnBac;

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getProductHsnBac() {
		return productHsnBac;
	}

	public void setProductHsnBac(String productHsnBac) {
		this.productHsnBac = productHsnBac;
	}

	@Override
	public String toString() {
		return "ProductBeanDuplicate [productId=" + productId + ", productName=" + productName + ", productSGST="
				+ productSGST + ", productCGST=" + productCGST + ", productHsnBac=" + productHsnBac + "]";
	}


	
}
