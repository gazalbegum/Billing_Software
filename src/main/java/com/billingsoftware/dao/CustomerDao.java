package com.billingsoftware.dao;

import java.util.List;

import com.billingsoftware.entities.Customer;

public interface CustomerDao {

	public void addCustomer(Customer customer);
	
	public void editCustomer(Customer customer);
	
	public void deleteCustomer(String customerId);
	
	public List<Customer> getCustomers();
	
	public Customer getCustomerForInvoice(String customerId);
}
