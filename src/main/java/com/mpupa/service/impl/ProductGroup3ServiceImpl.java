package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ProductGroup3Model;
import com.mpupa.service.IProductGroup3Service;

@Transactional
@Service(value="productGroup3Service")
public class ProductGroup3ServiceImpl implements IProductGroup3Service{

	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveProductGroup3(ProductGroup3Model clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductGroup3(Serializable clientId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductGroup3(ProductGroup3Model clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductGroup3Model getProductGroup3ById(Serializable clientId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductGroup3Model> listProductGroup3() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
