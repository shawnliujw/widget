package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.ProductModel;
import com.mpupa.model.ProductRetailersModel;

public interface IProductService {

	/**
	 * delete product
	 *
	 * @author shawn
	 * @date 2012 2012-9-16 下午2:15:46
	 */
	void deleteProduct(Serializable id);
	
	void deleteProduct(ProductModel productModel);
	
	/**
	 * sql语句插入product
	 * @param productDTO
	 * 2012-9-27 下午3:11:03
	 * @author Claire
	 */
	void saveProduct(ProductModel productModel);
	
	
	List<ProductModel> search(String s, String rtl);
	
	/**
	 * 根据Id取得对应商品
	 * 
	 * @param productId
	 * @param retailerName TODO
	 * @return
	 * 2012-7-23 下午3:04:40
	 * @author Claire
	 */
	ProductModel getProductModel(Integer productId, String retailerName);
	
	
	/**
	 * 根据多个Id去的对应商品, id如果多个应以 “，” 分割
	 * 
	 * @param appId
	 * @return
	 * 2012-7-23 下午3:04:40
	 * @author Claire
	 */
	List<ProductModel> getProductModelByIds(String productIds);
	
	/**
	 * 根据url取得对应的产品
	 * 
	 * @param url
	 * @return
	 * @author shawn
	 */
	ProductModel getProductModelByUrl(String url);
	
	List<ProductModel> listProduct();
	
	
	/**
	 * 根据brand，retailer，category取得商品列表
	 * 
	 * @param brandName
	 * @param retailerName
	 * @param categoryName
	 * @return
	 */
	List<ProductModel> searchProductModels(String brandName,String retailerName,String categoryName);
	
	/**
	 * 根据brand，retailer，category取得商品列表
	 * 
	 * @param brandName
	 * @param retailerName
	 * @param categoryName
	 * @return
	 */
	List<ProductModel> searchProductModelsForAs(String brandName,String retailerName,String categoryName);
	
	
	/**
	 * get product by brandName and retailerName
	 * @param brandName
	 * @param retailerName
	 * @return
	 * @author Shawn
	 * 2012-11-26
	 */
	List<ProductModel> getProducts(String brandName,String retailerName);
}
