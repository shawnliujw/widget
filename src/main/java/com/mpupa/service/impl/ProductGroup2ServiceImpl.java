package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ProductGroup2Model;
import com.mpupa.service.IProductGroup2Service;
@Transactional
@Service(value="productGroup2Service")
public class ProductGroup2ServiceImpl implements IProductGroup2Service{

	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveProductGroup2(ProductGroup2Model clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductGroup2(Serializable clientId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductGroup2(ProductGroup2Model clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductGroup2Model getProductGroup2ById(Serializable clientId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductGroup2Model> listProductGroup2() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
