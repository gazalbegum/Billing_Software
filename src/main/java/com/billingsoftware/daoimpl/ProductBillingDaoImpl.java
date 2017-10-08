package com.billingsoftware.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.billingsoftware.beans.BillingHistoryBean;
import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.dao.ProductBillingDao;
import com.billingsoftware.entities.Invoice;
import com.billingsoftware.utils.RequestUtil;

@Repository
public class ProductBillingDaoImpl implements ProductBillingDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private final String FIRST_INVOICE_COUNT = "0";

	@Override
	public void addProduct(List<Invoice> invoices) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		for(Invoice tempInvoice : invoices){
			session.save(tempInvoice);
		}    
		
		RequestUtil.invoiceBeanList.clear(); // clear the list once saved to DB
	}

	@Override
	public void editProduct(Invoice invoice) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		System.out.println("ENTITY INVOICE :" +invoice);
		
		String hql = "update Invoice set productName = :product_name, hsnBac = :hsn_bac,customerPaymentMode = :customer_payment_mode,productPrice = :product_price ,"
				+ "productSGST = :product_sgst ,productCGST = :product_cgst ,productQuantity = :product_quantity ,productRate = :product_rate ,challanNumber = :challan_number, challanDate = :challan_date, purchaseOrder = :purchase_order, purchaseDate = :purchase_date " 
				+ "where invoiceId = :invoice_id";
		 
		Query query = session.createQuery(hql);
		query.setParameter("product_name", invoice.getProductName());
		query.setParameter("hsn_bac", invoice.getHsnBac());
		query.setParameter("customer_payment_mode", invoice.getCustomerPaymentMode());
		query.setParameter("product_price", invoice.getProductPrice());
		query.setParameter("product_sgst", invoice.getProductSGST());
		query.setParameter("product_cgst", invoice.getProductCGST());
		query.setParameter("product_quantity", invoice.getProductQuantity());
		query.setParameter("product_rate", invoice.getProductRate());
		query.setParameter("challan_number", invoice.getChallanNumber());
		query.setParameter("challan_date", invoice.getChallanDate());
		query.setParameter("purchase_order", invoice.getPurchaseOrder());
		query.setParameter("purchase_date", invoice.getPurchaseDate());
		query.setParameter("invoice_id", invoice.getInvoiceId());
		 
		int rowsAffected = query.executeUpdate();
		if (rowsAffected > 0) {
		    System.out.println("Updated " + rowsAffected + " rows.");
		}
		}

	@Override
	public void deleteProduct(String invoiceId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
	    System.out.println("DAO invoiceId :" +invoiceId);
		Invoice invoice = (Invoice) session.load(Invoice.class, new Long(invoiceId));
		if(null != invoice){
			session.delete(invoice);
		}
		session.flush();
		System.out.println("product deleted successfully");
	}

	@Override
	public List<Invoice> getProducts(String invoiceNumber) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Criteria invoiceCriteria = session.createCriteria(Invoice.class);	
		if(invoiceNumber == null){			
			  String lastInvoiceNumber = getLastInvoiceNumber();
			  invoiceCriteria.add(Restrictions.eq("invoiceNumber", lastInvoiceNumber));
		      return invoiceCriteria.list();
		}
		
		invoiceCriteria.add(Restrictions.eq("invoiceNumber", invoiceNumber));
		return invoiceCriteria.list();
		
		
		  
	}

	@Override
	public String getLastInvoiceNumber() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();

		
		
		
		Criteria invoiceCriteria = session.createCriteria(Invoice.class);	
		
		ProjectionList projectionList=Projections.projectionList();
		projectionList.add(Projections.property("invoiceNumber"));
        
		invoiceCriteria.setProjection(projectionList);	
		invoiceCriteria.addOrder(Order.desc("invoiceId"));
		invoiceCriteria.setMaxResults(1);	
		
		if(invoiceCriteria.list().size() == 0){
			return FIRST_INVOICE_COUNT;
		}
		
		return (String)invoiceCriteria.list().get(0);
	}

	@Override
	public CustomerBean getFinalInvoiceDetails() {
		// TODO Auto-generated method stub
		
		
		return null;
	}

	@Override
	public List<BillingHistoryBean> getBillingHistory() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();	
		String sql = "select customer_name customerName,order_date orderDate, invoice_number invoiceNumber,sum(product_rate) as totalPrice from invoice,customers where invoice.customer_id = customers.customer_id group by invoice_number";
		Query query = session.createSQLQuery(sql).addScalar("customerName").addScalar("orderDate").addScalar("invoiceNumber").addScalar("totalPrice")
		.setResultTransformer(new AliasToBeanResultTransformer(BillingHistoryBean.class));
		List<BillingHistoryBean> billingHistoryBeans = (List<BillingHistoryBean>) query.list();
		return billingHistoryBeans;
	}

}
