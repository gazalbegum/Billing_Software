package com.billingsoftware.service;

import java.util.List;

import com.billingsoftware.beans.CustomerBean;

public interface CustomerService {

	public void addCustomer(CustomerBean customerBean);

	public void editCustomer(CustomerBean customerBean);

	public void deleteCustomer(String customerId);

	public List<CustomerBean> getCustomers();

	public CustomerBean getCustomerForInvoice(String customerId);
}
