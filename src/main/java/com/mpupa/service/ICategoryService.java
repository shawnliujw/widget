package com.mpupa.service;

import java.io.Serializable;
import java.util.List;


import com.mpupa.model.CategoryModel;

public interface ICategoryService {

	/**
	 * save <code>ClientSortModel</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 
	 */
	void saveCategory(CategoryModel clientModel);
	
	/**
	 * delete ClientSortModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 
	 */
	void deleteClientSort(Serializable clientId);
	
	/**
	 * delete ClientSortModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15  
	 */
	void deleteClientSort(CategoryModel clientModel);
	
	/**
	 * get ClientSortModel object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15  
	 */
	CategoryModel getClientSortById(Serializable clientId);
	
	/**
	 * get all ClientSortModel objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 
	 */
	List<CategoryModel> listCategory();
	
	/**
	 * 根据brandName取得category
	 * 
	 * @param brandName
	 * @return
	 * @author shawn
	 */
	List<CategoryModel> getCategoryByBrand(String brandName);
	
	/**
	 * 根据多个id取得category 中间以“,”分隔
	 * @param ids
	 * @return
	 * @author shawn
	 */
	List<CategoryModel> getCategoryModelsByIds(String ids);
	/**
	 * updateCategory
	 * @param category
	 */
	void updateCategory(CategoryModel category);
	
}
