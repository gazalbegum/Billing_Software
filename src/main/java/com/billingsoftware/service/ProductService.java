package com.billingsoftware.service;

import java.util.List;

import com.billingsoftware.beans.ProductBean;

public interface ProductService {

	public void addProduct(ProductBean productBean);
	
	public void editProduct(ProductBean productBean);
	
	public void deleteProduct(String productId);
	
	public List<ProductBean> getProducts();

	public ProductBean getProductById(String productId);
}
