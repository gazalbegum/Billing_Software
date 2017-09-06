package com.billingsoftware.test;

import java.util.ArrayList;
import java.util.List;

public class TestUpperCase2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String paramName = "product_hsn_bac_product_hsn_bac";
		String finalString = convertRequestStringToBeanMethodName(paramName);
		System.out.println(finalString);
	
	}
	
	 public static String convertRequestStringToBeanMethodName(String requestParam){ 
			
		 // Split original string to array
			String[] paramArray = requestParam.split("_");		
			
		 // Convert first letter to Uppercase
			List<String> paramListFirstLetterUpperCase = upperCaseFirst(paramArray);
			
		 // Merge converted string array to string
			String finalString = "";
			for(String tempString : paramListFirstLetterUpperCase){
				finalString = finalString + tempString;
			}
			
			return finalString;
	 }
	
	 public static List<String> upperCaseFirst(String[] paramArray) {

		 List<String> listString = new ArrayList<String>();
		 
		    for(String value : paramArray){
		    	// Convert String to char array.
		        char[] array = value.toCharArray();
		        // Modify first element in array.
		        array[0] = Character.toUpperCase(array[0]);
		        // Return string.
		        listString.add(new String(array));
		    }
		    return listString;
	    }
	
	     

}
