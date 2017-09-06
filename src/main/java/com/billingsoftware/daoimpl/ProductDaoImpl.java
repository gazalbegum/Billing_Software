package com.billingsoftware.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.billingsoftware.dao.ProductDao;
import com.billingsoftware.entities.Product;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		session.save(product);
	}

	@Override
	public void editProduct(Product product) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
				
		String hql = "update Product set productName = :product_name, productHsnBac = :product_hsn_bac, productSGST = :product_sgst ,productCGST = :product_cgst where productId = :product_id";
		 
		Query query = session.createQuery(hql);
		query.setParameter("product_name", product.getProductName());
		query.setParameter("product_hsn_bac", product.getProductHsnBac());	
		query.setParameter("product_sgst", product.getProductSGST());
		query.setParameter("product_cgst", product.getProductCGST());		
		query.setParameter("product_id", product.getProductId());
		 
		int rowsAffected = query.executeUpdate();
		if (rowsAffected > 0) {
		    System.out.println("Updated " + rowsAffected + " rows.");
		}
		
	}

	@Override
	public void deleteProduct(String productId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		
		String hql = "delete from Product where productId = :product_id";
		Query query = session.createQuery(hql);
		Long productIdLong = Long.parseLong(productId);
		query.setParameter("product_id", productIdLong);
		
		int rowsAffected = query.executeUpdate();
		
		if (rowsAffected > 0) {
		    System.out.println("Deleted " + rowsAffected + " rows.");
		}
	}

	@Override
	public List<Product> getProducts() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();		  
		return session.createCriteria(Product.class).list();
	}

	@Override
	public Product getProductById(String productId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();		
		Criteria criteria = session.createCriteria(Product.class).add(Restrictions.eq("productId", Long.valueOf(productId)));
		return (Product) criteria.uniqueResult() ;
	}
	
	
}
