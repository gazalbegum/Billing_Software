package com.billingsoftware.helpers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.billingsoftware.beans.CustomerBean;
import com.billingsoftware.beans.FinalInvoiceBean;
import com.billingsoftware.beans.InvoiceBean;
import com.billingsoftware.beans.ProductBean;
import com.billingsoftware.service.CustomerService;
import com.billingsoftware.service.ProductService;
import com.billingsoftware.utils.CommonUtils;

@Component
public class BeanHelper {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ProductService productService;

	public FinalInvoiceBean getDataForFinalInvoiceBean(List<InvoiceBean> invoiceBeans) {

		// TODO Auto-generated method stub
		String customerId = "";
		String invoiceNumber = "";
		String orderDate = "";

		double sgstCounter = 0.0;
		double cgstCounter = 0.0;
		double netPrice = 0.0;
		double totalPrice = 0.0;
		

		for (InvoiceBean tempInvoiceBean : invoiceBeans) {
			customerId = tempInvoiceBean.getCustomerId().toString();
			invoiceNumber = tempInvoiceBean.getInvoiceNumber();
			orderDate = tempInvoiceBean.getOrderDate() == null ? "" : tempInvoiceBean.getOrderDate().toString();
			break;
		}
		
		

		for (InvoiceBean tempInvoiceBean : invoiceBeans) {
			
			double productPriceDouble = Double.parseDouble(tempInvoiceBean.getProductPrice());
			double productRateDouble = Double.parseDouble(tempInvoiceBean.getProductRate());
			
			sgstCounter = sgstCounter + ((productPriceDouble * (  Double.parseDouble(tempInvoiceBean.getProductSGST()) / 100))* tempInvoiceBean.getProductQuantity());
			cgstCounter = cgstCounter + ((productPriceDouble  * (  Double.parseDouble(tempInvoiceBean.getProductCGST()) / 100))* tempInvoiceBean.getProductQuantity());
			netPrice = netPrice + productRateDouble;
			totalPrice = totalPrice + (productPriceDouble * tempInvoiceBean.getProductQuantity());
			System.out.println("sgstCounter" + sgstCounter);
		}
		
		CustomerBean customerBean = customerService.getCustomerForInvoice(customerId);

		FinalInvoiceBean finalInvoiceBean = new FinalInvoiceBean();
		finalInvoiceBean.setCustomerBean(customerBean);
		finalInvoiceBean.setInvoiceNumber(invoiceNumber);
		finalInvoiceBean.setOrderDate(orderDate);
		finalInvoiceBean.setTotalCGST(CommonUtils.convertToTwoDecimalPlaces(cgstCounter));
		finalInvoiceBean.setTotalSGST(CommonUtils.convertToTwoDecimalPlaces(sgstCounter));
		finalInvoiceBean.setNetPrice(CommonUtils.convertToTwoDecimalPlaces(netPrice));
        finalInvoiceBean.setTotalPrice(CommonUtils.convertToTwoDecimalPlaces(totalPrice));

        return finalInvoiceBean;
	
	}
	
	
	public Map<Integer, String> getCustomerMap() {

		Map<Integer, String> customerMap = new HashMap<Integer, String>();
		List<CustomerBean> customers = customerService.getCustomers();

		if(customers != null && customers.size() > 0){
			for (CustomerBean tempCustomerBean : customers) {
				Integer key = tempCustomerBean.getCustomerId().intValue();
				String value = tempCustomerBean.getCustomerName();
				customerMap.put(key, value);
			}
		}		
		
		System.out.println("customerMap :" +customerMap);
		return customerMap;
	}
	
	
	public Map<Integer, String> getProductMap() {

		Map<Integer, String> productMap = new HashMap<Integer, String>();
		List<ProductBean> productBeans = productService.getProducts();

		if(productBeans != null && productBeans.size() > 0){
			for (ProductBean tempProductBean : productBeans) {
				Integer key = tempProductBean.getProductId().intValue();
				String value = tempProductBean.getProductName();
				productMap.put(key, value);
			}
		}		
		
		System.out.println("productMap :" +productMap);
		return productMap;
	}
}
