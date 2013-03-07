package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.ProductRetailersModel;

public interface IProductRetailersService {

	/**
	 * get ProductRetailersModel object
	 *
	 * @author shawn
	 * @date 2012 2012-9-16 下午2:11:35
	 */
	void saveProductRetailers(ProductRetailersModel productRetailersModel);
	
	/**
	 * delete  ProductRetailersModel object
	 *
	 * @author shawn
	 * @date 2012 2012-9-16 下午2:12:01
	 */
	void deleteProductRetailers(Serializable id);
	
	/**
	 * ProductRetailersModel object
	 *
	 * @author shawn
	 * @date 2012 2012-9-16 下午2:12:13
	 */
	void deleteProductRetailers(ProductRetailersModel productRetailersModel);
	
	/**
	 *  get ProductRetailersModel object
	 *
	 * @author shawn
	 * @date 2012 2012-9-16 下午2:12:22
	 */
	ProductRetailersModel getProductRetailersModel(Serializable id);
	
    /**
     * list ProductRetailersModel objects
     *
     * @author shawn
     * @date 2012 2012-9-16 下午2:12:35
     */
	List<ProductRetailersModel> listProductRetailersModels();
	
	/**
	 * 根据brand，retailer，category取得商品列表
	 * 
	 * @param brandName
	 * @param retailerName
	 * @param categoryName
	 * @return
	 */
	List<ProductRetailersModel> searchProductRetailersModels(String brandName,String retailerName,String categoryName);
	
	/**
	 * 根据retailerName和productId取得唯一的productRetailer对象
	 * @param retailerName
	 * @param productId
	 * @return
	 */
	ProductRetailersModel getProductRetailersModelByRetailerAndProductId(String retailerName,Integer productId);
}
