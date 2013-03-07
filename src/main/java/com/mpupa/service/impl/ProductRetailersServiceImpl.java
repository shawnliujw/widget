package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ProductModel;
import com.mpupa.model.ProductRetailersModel;
import com.mpupa.service.IProductRetailersService;
import com.mpupa.service.IProductService;
import com.mpupa.utils.WebAppUtil;

@Transactional
@Service(value = "productRetailersService")
public class ProductRetailersServiceImpl implements IProductRetailersService {

	Logger logger = Logger.getLogger(ProductRetailersServiceImpl.class);
	
	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveProductRetailers(ProductRetailersModel productRetailersModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.saveObject("",productRetailersModel);
	}

	@Override
	public void deleteProductRetailers(Serializable id) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",id);
	}

	@Override
	public ProductRetailersModel getProductRetailersModel(Serializable id) {
		// TODO Auto-generated method stub
		return this.getProductRetailersModel(id);
	}

	@Override
	public void deleteProductRetailers(
			ProductRetailersModel productRetailersModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",productRetailersModel);
	}

	@Override
	public List<ProductRetailersModel> listProductRetailersModels() {
		// TODO Auto-generated method stub
		return (List<ProductRetailersModel>) this.myBatisDao.getObjectList("");
	}

	@Override
	public List<ProductRetailersModel> searchProductRetailersModels(
			String brandName, String retailerName, String categoryName) {
		// TODO Auto-generated method stub
		String hql = "from ProductRetailersModel as pr left join fetch pr.product.categories c where pr.retailer.name='" +WebAppUtil.proceedSingleQuote(retailerName)+
				"' and  pr.product.valid='0' and pr.product.brand.name='"+WebAppUtil.proceedSingleQuote(brandName)+"' and c.name='"+WebAppUtil.proceedSingleQuote(categoryName)+"'";
		
//		String hql = "select pr.id,pr.in_stock,pr.offer_id,pr.price_now,pr.price_was, pr.product_id ,pr.product_url,pr.retailer_id from product_retailer pr "
//						+"left join retailer r on pr.retailer_id=r.id "
//						+"left join product p on pr.product_id=p.id"
//						+"left join brand b on p.brand_id=b.id"
//						+"left join _brand_category bc on bc.brand_id=b.id"
//						+"left join category c on bc.category_id=c.id"
//						+"where b.name='"+brandName+"'and c.name='"+categoryName+"' and r.name='"+retailerName+"'";
					
		List<ProductRetailersModel> list = (List<ProductRetailersModel>) this.myBatisDao.getObjectList(hql);
		//list = (List<ProductRetailersModel>) this.productRetailersDao.executeSelectSql(hql, true);
		return list;
	}

	@Override
	public ProductRetailersModel getProductRetailersModelByRetailerAndProductId(
			String retailerName, Integer productId) {
		// TODO Auto-generated method stub
		
		String hql = "from ProductRetailersModel p where p.retailer.name='"+WebAppUtil.proceedSingleQuote(retailerName)+"' and p.product.id="+productId;
		List<ProductRetailersModel> list = (List<ProductRetailersModel>) this.myBatisDao.getObjectList(hql);
		
		ProductRetailersModel productRetailersModel = new ProductRetailersModel();
		if(null != list && list.size() > 0) {
			productRetailersModel = list.get(0);
		}else {
			logger.error("Can not find ProductRetailerModel by retailer'"+retailerName+"' and productId '"+productId+" '");
		}
		
		return productRetailersModel;
	}


	
	

}
