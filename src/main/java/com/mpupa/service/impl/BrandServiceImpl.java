/**
 * 
 */
package com.mpupa.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.BrandModel;
import com.mpupa.service.IBrandService;
import com.mpupa.utils.WebAppUtil;

/**
 * @author 
 *
 */
@Transactional
@Service(value = "brandService")
public class BrandServiceImpl implements IBrandService {
	
	
	Logger logger = Logger.getLogger(BrandServiceImpl.class);
	
	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;
	
	@Override
	public BrandModel getBrandModelByBrandName(String brandName) {
		// TODO Auto-generated method stub
		return (BrandModel) myBatisDao.getObject("com.mpupa.model.brand.getBrandByName", brandName);
	}

	@Override
	public void saveBrand(BrandModel brandModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BrandModel> listBrand() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getBrandDetailByBrandName(String brandName, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String version = WebAppUtil.checkUserDvice(request);
		Map<String, Object> map = this.myBatisDao.getObject("com.mpupa.model.brand.getBrandDetailsByName", brandName);
		if(map==null)return null;
		if(version.equalsIgnoreCase("pc")) {
			if(null != map.get("pcTemplateFolder") && !"".equalsIgnoreCase(map.get("pcTemplateFolder").toString())) {
				map.put("templateFolder", map.get("pcTemplateFolder"));
			} else {
				map.put("templateFolder", map.get("mobileTemplateFolder"));
			}
		} else {
			if(map.get("mobileTemplateFolder") != null && !"".equalsIgnoreCase(map.get("mobileTemplateFolder").toString())) {
				map.put("templateFolder", map.get("mobileTemplateFolder"));
			} else {
				map.put("templateFolder", map.get("pcTemplateFolder"));
			}
		}
		
		
		return map;
	}

	@Override
	public List<Map<String, String>> getCategoryByBrandName(String brandName) {
		// TODO Auto-generated method stub
		return this.myBatisDao.getObjectList("com.mpupa.model.brand.getCategoryByName", brandName);
	}


}
