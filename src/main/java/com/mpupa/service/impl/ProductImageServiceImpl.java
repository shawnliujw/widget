///**
// * 
// */
//package com.mpupa.service.impl;
//
//import javax.annotation.Resource;
//
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.mpupa.dao.IProductImageDao;
//import com.mpupa.model.ProductImageDTO;
//import com.mpupa.service.IProductImageService;
//
///**
// * @author Administrator
// *
// */
//
//@Transactional
//@Service(value="productImageService")
//public class ProductImageServiceImpl implements IProductImageService {
//	
//	@Resource(name="productImageDao")
//	private IProductImageDao productImageDao;
//	@Override
//	public void saveProductImage(ProductImageDTO productImage) {
//		// TODO Auto-generated method stub
//		this.productImageDao.saveObject(productImage);
//		
//	}
//
//	@Override
//	public void updateProductImage(ProductImageDTO productImage) {
//		// TODO Auto-generated method stub
//		this.productImageDao.updateObject(productImage);
//		
//	}
//
//}
