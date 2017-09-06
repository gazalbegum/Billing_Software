package com.billingsoftware.helpers;

import org.springframework.stereotype.Component;

import com.billingsoftware.utils.CommonUtils;

@Component
public class ServiceHelper {

	private final String FIRST_INVOICE_COUNT = "0";
	
	public String getInvoiceFormat(String lastInvoiceNumber) {
		// TODO Auto-generated method stub		
		
		if(FIRST_INVOICE_COUNT.equalsIgnoreCase(lastInvoiceNumber)){
			return CommonUtils.getCurrentYear()+"-"+1; 
		}
		
		String [] invoiceArray = lastInvoiceNumber.split("-");
	    Integer count = new Integer(invoiceArray[1]);
	    count = count + 1;		
		String format = CommonUtils.getCurrentYear()+"-"+count; 
		return format;
	}
}
