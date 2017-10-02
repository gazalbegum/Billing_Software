package com.billingsoftware.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.billingsoftware.dao.CustomerDao;
import com.billingsoftware.entities.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void editCustomer(Customer customer) {
		// TODO Auto-generated method stub
	
		Session session = sessionFactory.openSession();
	
		
		String hql = "update Customer set customerName = :customer_name, customerGstIn = :customer_gst_in,customerAddress = :customer_address ,customerPhone = :customer_phone ,customerEmailId = :customer_email_id  where customerId = :customer_id";

		
		Query query = session.createQuery(hql);
		query.setParameter("customer_name", customer.getCustomerName());
		query.setParameter("customer_gst_in", customer.getcustomerGstIn());
		query.setParameter("customer_address", customer.getCustomerAddress());
		query.setParameter("customer_phone", customer.getCustomerPhone());
		query.setParameter("customer_email_id", customer.getCustomerEmailId());
		query.setParameter("customer_id", customer.getCustomerId());
		
		int rowsAffected = query.executeUpdate();
		if (rowsAffected > 0) {
		    System.out.println("Updated " + rowsAffected + " rows.");
		}
	}

	@Override
	public void deleteCustomer(String customerId) {
		Session session = sessionFactory.openSession();
		
		String hql = "delete from Customer where customerId = :customer_id";
		Query query = session.createQuery(hql);
		Long invoiceIdLong = Long.parseLong(customerId);
		query.setParameter("customer_id", invoiceIdLong);
		
		int rowsAffected = query.executeUpdate();
		
		if (rowsAffected > 0) {
		    System.out.println("Deleted " + rowsAffected + " rows.");
		}
	}

	@Override
	public List<Customer> getCustomers() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		return session.createCriteria(Customer.class).list();
	}

	@Override
	public void addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.save(customer);
	}

	@Override
	public Customer getCustomerForInvoice(String customerId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();		
		String hql = "from Customer where customerId= :customerId";		            		
		Query query = session.createQuery(hql);
		query.setString("customerId", customerId);
		List<Customer> results = (List<Customer>) query.list();
		return (Customer) results.get(0);
	}

}
