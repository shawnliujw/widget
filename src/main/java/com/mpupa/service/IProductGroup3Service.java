/**
 * 
 */
package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.ProductGroup3Model;

/**
 * @author 
 *
 */
public interface IProductGroup3Service {

	/**
	 * save <code>ProductGroup3Model</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:25
	 */
	void saveProductGroup3(ProductGroup3Model clientModel);
	
	/**
	 * delete ProductGroup3Model object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteProductGroup3(Serializable clientId);
	
	/**
	 * delete ProductGroup3Model object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteProductGroup3(ProductGroup3Model clientModel);
	
	/**
	 * get ProductGroup3Model object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:12:17
	 */
	ProductGroup3Model getProductGroup3ById(Serializable clientId);
	
	/**
	 * get all ProductGroup3Model objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:14:57
	 */
	List<ProductGroup3Model> listProductGroup3();
}
