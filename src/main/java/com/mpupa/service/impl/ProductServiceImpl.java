package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ProductModel;
import com.mpupa.service.IProductService;
import com.mpupa.utils.WebAppUtil;

@Transactional
@Service(value = "productService")
public class ProductServiceImpl implements IProductService {

	Logger logger = Logger.getLogger(ProductServiceImpl.class);
	
	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveProduct(ProductModel productModel) {
		// TODO Auto-generated method stub
		myBatisDao.saveObject("",productModel);
	}

	@Override
	public List<ProductModel> search(String s,String rtl) {
		
		List<ProductModel> list = null;
		if(null != s && !"".equals(s) && null != rtl && !"".equals(rtl)) {
			String hql = "from ProductModel p where 1=1 ";
			if(s.indexOf(",") != -1) {
				String[] array = s.split(",");
				for (int i = 0; i < array.length; i++) {
					hql += " and p.title like '%"+ array[i] + "%'";
				}
			} else if(s.indexOf(" ") != -1) {
				String[] array = s.split(" ");
				for (int i = 0; i < array.length; i++) {
					String string = array[i];
					if(!string.equals(" ") && !"".equals(string)) {
						hql += " and p.title like '%"+ string + "%'";
					}
				}
			} else {
				
				hql="from ProductModel p where p.title like '%"+s+"%' and p.client='"+rtl+"'";
			}
			
			list = (List<ProductModel>) myBatisDao.getObjectList("", new HashMap<String, Object>());
			
		}
		
		return list;
	}

	@Override
	public ProductModel getProductModel(Integer productId, String retailerName) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productId", productId);
		map.put("retailerName", WebAppUtil.proceedSingleQuote(retailerName));
		
		return this.myBatisDao.getObject("com.mpupa.model.product.getProductById", map);
	}

	@Override
	public List<ProductModel> getProductModelByIds(String productIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductModel getProductModelByUrl(String url) {
		

		ProductModel productModel = null;
		
		//String hql = "from ProductModel p left join p."
		
		return productModel;
	}

	@Override
	public void deleteProduct(Serializable id) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",id);
	}

	@Override
	public void deleteProduct(ProductModel productModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",1);
	}

	@Override
	public List<ProductModel> listProduct() {
		// TODO Auto-generated method stub
		return (List<ProductModel>) this.myBatisDao.getObjectList("com.mpupa.model.product.searchProducts");
	}

	@Override
	public List<ProductModel> searchProductModels(String brandName,
			String retailerName, String categoryName) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", WebAppUtil.proceedSingleQuote(brandName));
		map.put("retailerName", WebAppUtil.proceedSingleQuote(retailerName));
		map.put("categoryName", WebAppUtil.proceedSingleQuote(categoryName));
		return (List<ProductModel>) this.myBatisDao.getObjectList("com.mpupa.model.product.searchProducts",map);
	}
	@Override
	public List<ProductModel> searchProductModelsForAs(String brandName,
			String retailerName, String categoryName) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", WebAppUtil.proceedSingleQuote(brandName));
		map.put("retailerName", WebAppUtil.proceedSingleQuote(retailerName));
		map.put("categoryName", WebAppUtil.proceedSingleQuote(categoryName));
		return (List<ProductModel>) this.myBatisDao.getObjectList("com.mpupa.model.product.searchProductsForAs",map);
	}

	@Override
	public List<ProductModel> getProducts(String brandName, String retailerName) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", WebAppUtil.proceedSingleQuote(brandName));
		map.put("retailerName", WebAppUtil.proceedSingleQuote(retailerName));
		return (List<ProductModel>) this.myBatisDao.getObjectList("com.mpupa.model.product.searchProducts",map);
	}
	
	

}
