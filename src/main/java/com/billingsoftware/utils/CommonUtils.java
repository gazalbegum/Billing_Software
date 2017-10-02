package com.billingsoftware.utils;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CommonUtils {

	private static DecimalFormat decimalFormat = new DecimalFormat("0.00");
	
	public static String getCurrentYear(){
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		return String.valueOf(year);
	}
	
	public static String convertToFormatDDMMYYYY(String dateString){
		String toFormat = "dd/MM/yyyy";
		String fromFormat = "yyyy-MM-dd";
		DateFormat formatter = new SimpleDateFormat(fromFormat); 
		Date date = null;
		try {
			date = (Date)formatter.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new SimpleDateFormat(toFormat).format(date);
	}
	
	public static Date convertToFormatDDMMYYYYDate(String dateString){
		String toFormat = "dd/MM/yyyy";
		String fromFormat = "dd/MM/yyyy";
		DateFormat formatter = new SimpleDateFormat(fromFormat); 
		Date date = null;
		try {
			date = (Date)formatter.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return date;	
	}
	
    public static String convertToTwoDecimalPlaces(double tempNumber){
    	return decimalFormat.format(tempNumber);
    }
}
