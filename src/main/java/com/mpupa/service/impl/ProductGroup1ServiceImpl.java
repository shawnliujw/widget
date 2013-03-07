package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ProductGroup1Model;
import com.mpupa.service.IProductGroup1Service;

@Transactional
@Service(value = "productGroup1Service")
public class ProductGroup1ServiceImpl implements IProductGroup1Service{

	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveProductGroup1(ProductGroup1Model clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductGroup1(Serializable clientId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductGroup1(ProductGroup1Model clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductGroup1Model getProductGroup1ById(Serializable clientId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductGroup1Model> listProductGroup1() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
