package com.billingsoftware.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.dao.CustomerDao;
import com.billingsoftware.entities.Customer;
import com.billingsoftware.service.CustomerService;
import com.billingsoftware.utils.BeanUtil;

@Service
public class CustomerServiceImpl implements CustomerService{

	@Autowired
	private CustomerDao customerDao;
	
	@Override
	@Transactional
	public void editCustomer(CustomerBean customerBean) {
		// TODO Auto-generated method stub
		Customer customer = BeanUtil.setCustomerBeanToEntity(customerBean);
		customerDao.editCustomer(customer);
	}

	@Override
	@Transactional
	public void deleteCustomer(String customerId) {
		customerDao.deleteCustomer(customerId);
	}

	@Override
	@Transactional
	public List<CustomerBean> getCustomers() {
		// TODO Auto-generated method stub
		List<Customer> customers = customerDao.getCustomers();		
		return BeanUtil.setCustomerEntitiesToBeans(customers);
	}

	@Override
	public void addCustomer(CustomerBean customerBean) {
		// TODO Auto-generated method stub
		Customer customer = BeanUtil.setCustomerBeanToEntity(customerBean);
		customerDao.addCustomer(customer);
	}

	@Override
	public CustomerBean getCustomerForInvoice(String customerId) {
		// TODO Auto-generated method stub
		Customer customer = customerDao.getCustomerForInvoice(customerId);		
		return BeanUtil.setCustomerEntityToBean(customer);
	}

}
