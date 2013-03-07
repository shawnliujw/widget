package com.mpupa.service;

import java.util.List;

import com.mpupa.model.ProductModel;

public interface IFlashService {

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
	 * 根据brandName和categoryName取得对应的youtube url
	 * @param brandName
	 * @param categoryName
	 * @return
	 * @author Shawn
	 * 2012-11-29
	 */
	String getYoutubeLink(String brandName,String categoryName);
	
	/**
	 * 根据brandName和categoryName 取得对应的产品，然后再取得销售这些产品的retailer 列表
	 * @param brandName
	 * @param categoryName
	 * @return
	 * @author Shawn
	 * 2012-11-29
	 */
	List<String> getRetailers(String brandName,String categoryName);
}
