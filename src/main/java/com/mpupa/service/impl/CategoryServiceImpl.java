package com.mpupa.service.impl;

import java.io.Serializable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.CategoryModel;
import com.mpupa.service.ICategoryService;
import com.mpupa.utils.WebAppUtil;

@Transactional
@Service(value="categoryService")
public class CategoryServiceImpl implements ICategoryService{

	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;
	
	@Override
	public void saveCategory(CategoryModel clientSortModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.saveObject("",clientSortModel);
	}

	@Override
	public void deleteClientSort(Serializable clientSortId) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",clientSortId);
	}

	@Override
	public void deleteClientSort(CategoryModel clientSortModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",clientSortModel.getId());
	}

	@Override
	public CategoryModel getClientSortById(Serializable clientSortId) {
		// TODO Auto-generated method stub
		return this.myBatisDao.getObject("",clientSortId);
	}

	@Override
	public List<CategoryModel> listCategory() {
		// TODO Auto-generated method stub
		return (List<CategoryModel>) this.myBatisDao.getObjectList("com.mpupa.model.category");
	}


	@Override
	public List<CategoryModel> getCategoryModelsByIds(String ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CategoryModel> getCategoryByBrand(String brandName) {
		// TODO Auto-generated method stub
		//String hql = "from CategoryModel c where c.brand.name='"+WebAppUtil.proceedSingleQuote(brandName)+"'";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", WebAppUtil.proceedSingleQuote(brandName));
		return (List<CategoryModel>) this.myBatisDao.getObjectList("getCategoryByBrand", map);
	}

	@Override
	public void updateCategory(CategoryModel category) {
		// TODO Auto-generated method stub
		this.myBatisDao.updateObject("",category);
		
	}




}
