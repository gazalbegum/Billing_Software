package com.billingsoftware.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.billingsoftware.beans.BillingHistoryBean;
import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.beans.InvoiceBean;
import com.billingsoftware.dao.ProductBillingDao;
import com.billingsoftware.entities.Invoice;
import com.billingsoftware.helpers.ServiceHelper;
import com.billingsoftware.service.ProductBillingService;
import com.billingsoftware.utils.BeanUtil;
import com.billingsoftware.utils.RequestUtil;

@Service
public class ProductBillingServiceImpl implements ProductBillingService{

	@Autowired
	private ProductBillingDao productBillingDao;
	
	@Autowired
	private ServiceHelper serviceHelper;
	
	@Override
	@Transactional
	public void addProduct() {
		
		List<InvoiceBean> invoiceBeans = RequestUtil.invoiceBeanList;
		List<Invoice> invoices = BeanUtil.setInvoiceBeansToEntities(invoiceBeans);
		String lastInvoiceNumber = productBillingDao.getLastInvoiceNumber();	
		String invoiceNumber = serviceHelper.getInvoiceFormat(lastInvoiceNumber);
		for(Invoice tempInvoice : invoices){
			tempInvoice.setInvoiceNumber(invoiceNumber);
		}		
		productBillingDao.addProduct(invoices);
	}
	
	@Override
	@Transactional
	public void editProduct(InvoiceBean invoiceBean) {
		// TODO Auto-generated method stub
		Invoice invoice = BeanUtil.setInvoiceBeanToEntity(invoiceBean);
		productBillingDao.editProduct(invoice);
	}

	@Override
	@Transactional
	public void deleteProduct(String invoiceId) {
		// TODO Auto-generated method stub
		productBillingDao.deleteProduct(invoiceId);
	}

	@Override
	@Transactional
	public List<InvoiceBean> getProducts(String invoiceNumber) {
		// TODO Auto-generated method stub		
		List<Invoice> invoices = productBillingDao.getProducts(invoiceNumber);
		return BeanUtil.setInvoiceEntitiesToBeans(invoices);
	}

	@Override
	public CustomerBean getFinalInvoiceDetails() {
		// TODO Auto-generated method stub
		return productBillingDao.getFinalInvoiceDetails();
	}

	@Override
	public List<BillingHistoryBean> getBillingHistory() {
		// TODO Auto-generated method stub		
		return productBillingDao.getBillingHistory();
	}

}
