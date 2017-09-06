package com.billingsoftware.serviceimpl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.billingsoftware.beans.ProductBean;
import com.billingsoftware.dao.ProductDao;
import com.billingsoftware.entities.Product;
import com.billingsoftware.service.ProductService;
import com.billingsoftware.utils.BeanUtil;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	@Transactional
	public void addProduct(ProductBean productBean) {
		// TODO Auto-generated method stub
		Product product = new Product();
		//Product product = BeanUtil.setProductBeanToEntity(productBean);
		try {
			BeanUtils.copyProperties(product, productBean);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		productDao.addProduct(product);
	}

	@Override
	@Transactional
	public void editProduct(ProductBean productBean) {
		// TODO Auto-generated method stub
		Product product = BeanUtil.setProductBeanToEntity(productBean);
		productDao.editProduct(product);
	}

	@Override
	@Transactional
	public void deleteProduct(String productId) {	
		productDao.deleteProduct(productId);		
	}

	@Override
	@Transactional
	public List<ProductBean> getProducts() {
		// TODO Auto-generated method stub
		List<Product> products = productDao.getProducts();
		return BeanUtil.setEntitesToProductBean(products);
	}

	@Override
	public ProductBean getProductById(String productId) {
		// TODO Auto-generated method stub
		Product product = productDao.getProductById(productId);
		return BeanUtil.setEntityToProductBean(product);
	}

}
