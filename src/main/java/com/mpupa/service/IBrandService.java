/**
 * 
 */
package com.mpupa.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.mpupa.model.BrandModel;
import com.mpupa.model.OfferModel;

/**
 * @author 
 *
 */
public interface IBrandService {
	

	/**
	 * 根据brandName取得brandName
	 *
	 * @author shawn
	 * @date 2012 2012-9-20 下午10:11:14
	 */
	BrandModel getBrandModelByBrandName(String brandName);
	
	/**
	 * 根据brandName取得相关的信息
	 * @param brandName
	 * @param request TODO
	 * @return
	 * @author Shawn
	 * 2012-10-18
	 */
	Map<String, Object> getBrandDetailByBrandName(String brandName, HttpServletRequest request);
	
	/**
	 * save()
	 * @param clientModel
	 * 2012-9-26 下午1:11:24
	 * @author Claire
	 */
	void saveBrand(BrandModel brandModel);
	/**
	 * 
	 * @return
	 * 2012-9-27 上午9:28:11
	 * @author Claire
	 */
	List<BrandModel> listBrand();
	
	/**
	 * 根据brandName取得拥有商品的category
	 * @param brandName
	 * @return
	 * @author Shawn
	 * 2012-11-8
	 */
	List<Map<String, String>> getCategoryByBrandName(String brandName);
}
