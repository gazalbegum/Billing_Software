package com.billingsoftware.test;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.billingsoftware.beans.ProductBean;
import com.billingsoftware.beans.ProductBeanDuplicate;

public class TestBeanCopy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ProductBean productBean = new ProductBean();
		
		productBean.setProductCGST("9");
		productBean.setProductHsnBac("32432");
		productBean.setProductId(1L);
		productBean.setProductName("sensors");
		productBean.setProductSGST("9");
		
		ProductBeanDuplicate productBeanDuplicate = new ProductBeanDuplicate();
		try {
			BeanUtils.copyProperties(productBeanDuplicate, productBean);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(productBeanDuplicate);
	}

}
