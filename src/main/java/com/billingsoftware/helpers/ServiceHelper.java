package com.billingsoftware.helpers;

import org.springframework.stereotype.Component;

import com.billingsoftware.utils.CommonUtils;

@Component
public class ServiceHelper {

	private final String FIRST_INVOICE_COUNT = "0";
	
	public String getInvoiceFormat(String lastInvoiceNumber) {
		// TODO Auto-generated method stub		
		
		String currentYear = CommonUtils.getCurrentYear();
		
		// Test year
		//currentYear = "2018";
		
		if(FIRST_INVOICE_COUNT.equalsIgnoreCase(lastInvoiceNumber)){
			return currentYear+"-"+1; 
		}
		
	
		String [] invoiceArray = lastInvoiceNumber.split("-");
	    Integer count = new Integer(invoiceArray[1]);
	    String dateDB = invoiceArray[0];
	    count = count + 1;		
		String format = currentYear+"-"+count; 
	    
	    if(!currentYear.equalsIgnoreCase(dateDB)){
	    	return currentYear+"-"+1; 
	    }
	    
	   
		return format;
	}
	
	
}
