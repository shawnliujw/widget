/**
 * 
 */
package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.ProductGroup2Model;

/**
 * @author 
 *
 */
public interface IProductGroup2Service {

	/**
	 * save <code>ProductGroup2Model</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:25
	 */
	void saveProductGroup2(ProductGroup2Model clientModel);
	
	/**
	 * delete ProductGroup2Model object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteProductGroup2(Serializable clientId);
	
	/**
	 * delete ProductGroup2Model object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteProductGroup2(ProductGroup2Model clientModel);
	
	/**
	 * get ProductGroup2Model object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:12:17
	 */
	ProductGroup2Model getProductGroup2ById(Serializable clientId);
	
	/**
	 * get all ProductGroup2Model objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:14:57
	 */
	List<ProductGroup2Model> listProductGroup2();
}
