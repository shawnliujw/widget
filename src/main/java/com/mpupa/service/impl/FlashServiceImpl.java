package com.mpupa.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ProductModel;
import com.mpupa.service.IFlashService;
import com.mpupa.utils.WebAppUtil;

@Service(value="flashService")
public class FlashServiceImpl implements IFlashService{

	@Resource(name="myBatisDao")
	IBaseDao baseDao;
	
	@Override
	public List<ProductModel> searchProductModelsForAs(String brandName,
			String retailerName, String categoryName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", WebAppUtil.proceedSingleQuote(brandName));
		map.put("retailerName", WebAppUtil.proceedSingleQuote(retailerName));
		map.put("categoryName", WebAppUtil.proceedSingleQuote(categoryName));
		return (List<ProductModel>) this.baseDao.getObjectList("com.mpupa.model.as.searchProductsForAs",map);
	}

	@Override
	public String getYoutubeLink(String brandName, String categoryName) {
		// TODO Auto-generated method stub
		String list = this.baseDao.getObject("com.mpupa.model.as.searchYoutubeLink", categoryName);
		return list;
	}

	@Override
	public List<String> getRetailers(String brandName,
			String categoryName) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", brandName);
		map.put("categoryName", categoryName);
		List<String> lsit = (List<String>) this.baseDao.getObjectList("com.mpupa.model.as.searchFlashRetailer", map);
		return lsit;
	}

}
