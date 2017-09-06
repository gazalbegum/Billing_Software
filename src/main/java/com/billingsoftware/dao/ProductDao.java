package com.billingsoftware.dao;

import java.util.List;

import com.billingsoftware.entities.Product;

public interface ProductDao {

	public void addProduct(Product product);
	
	public void editProduct(Product product);
	
	public void deleteProduct(String productId);
	
	public List<Product> getProducts();
	
	public Product getProductById(String productId);
}
