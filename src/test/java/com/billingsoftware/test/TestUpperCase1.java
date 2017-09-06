package com.billingsoftware.test;

import java.util.ArrayList;
import java.util.List;

public class TestUpperCase1 {

	public static void main(String[] args) {
		
		String paramName = "hroduct_hsn_bac_lroduct_hsn_bac";
		
		List<Integer> indexList = getAllIndexesForUnderscores(paramName);	
		
		for(Integer tempIndex : indexList){		
			char charIndex = paramName.charAt(tempIndex+1);
			String charLowerCase = new Character(charIndex).toString();
			String charUpperCase = charLowerCase.toUpperCase();
			paramName = paramName.replace(charLowerCase, charUpperCase);			
		}
		paramName = paramName.replaceAll("_", "");
		System.out.println(paramName);
		
	
	
	}

	private static List<Integer> getAllIndexesForUnderscores(String paramName) {
		// TODO Auto-generated method stub
		List<Integer> indexList = new ArrayList<Integer>();
		String underScore = "_";
		int index = paramName.indexOf(underScore);
		while (index >= 0) {
			indexList.add(index);
		    index = paramName.indexOf(underScore, index + 1);		    
		}
		System.out.println("indexList :" +indexList);
		return indexList;
	}
}
