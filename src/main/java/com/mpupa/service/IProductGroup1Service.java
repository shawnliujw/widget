/**
 * 
 */
package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.ProductGroup1Model;

/**
 * @author 
 *
 */
public interface IProductGroup1Service {

	/**
	 * save <code>ProductGroup1Model</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:25
	 */
	void saveProductGroup1(ProductGroup1Model clientModel);
	
	/**
	 * delete ProductGroup1Model object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteProductGroup1(Serializable clientId);
	
	/**
	 * delete ProductGroup1Model object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteProductGroup1(ProductGroup1Model clientModel);
	
	/**
	 * get ProductGroup1Model object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:12:17
	 */
	ProductGroup1Model getProductGroup1ById(Serializable clientId);
	
	/**
	 * get all ProductGroup1Model objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:14:57
	 */
	List<ProductGroup1Model> listProductGroup1();
}
