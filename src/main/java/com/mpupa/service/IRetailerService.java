/**
 * 
 */
package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.RetailerModel;

/**
 * @author 
 *
 */
public interface IRetailerService {

	/**
	 * save <code>RetailerModel</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:25
	 */
	void saveRetailer(RetailerModel clientModel);
	
	/**
	 * delete RetailerModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteRetailer(Serializable clientId);
	
	/**
	 * delete RetailerModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteRetailer(RetailerModel clientModel);
	
	/**
	 * get RetailerModel object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:12:17
	 */
	RetailerModel getRetailerById(Serializable clientId);
	
	/**
	 * get all RetailerModel objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:14:57
	 */
	List<RetailerModel> listRetailer();
	
	/**
	 * 根据brandName取到 拥有该品牌商品的retailer
	 * 
	 * @param brandName
	 * @return
	 * @author shawn
	 */
	List<RetailerModel> searchRetailersByBrandName(String brandName);
}
