/**
 * 
 */
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
import com.mpupa.model.RetailerModel;
import com.mpupa.service.IRetailerService;
import com.mpupa.utils.WebAppUtil;

/**
 * @author 
 *
 */
@Transactional
@Service(value = "retailerService")
public class RetailerServiceImpl implements IRetailerService {
	
	Logger logger = Logger.getLogger(RetailerServiceImpl.class);
	
	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	

	@Override
	public List<RetailerModel> searchRetailersByBrandName(String brandName) {
		// TODO Auto-generated method stub
		
		
		/*Session session = this.retailerDao.getCurrentSession();
		Query query = session.createSQLQuery(sqlString).addEntity(RetailerModel.class);
		
		List<RetailerModel> retailerModels = (List<RetailerModel>) query.list();*/
		
		//List<RetailerModel> retailerModels1 = (List<RetailerModel>) this.retailerDao.executeSelectSql(sqlString,true);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("brandName", brandName);
		return (List<RetailerModel>) this.myBatisDao.getObjectList("com.mpupa.model.RetailerModel.getRetailersByBrandName", map);
	}



	@Override
	public void saveRetailer(RetailerModel clientModel) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void deleteRetailer(Serializable clientId) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void deleteRetailer(RetailerModel clientModel) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public RetailerModel getRetailerById(Serializable clientId) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<RetailerModel> listRetailer() {
		// TODO Auto-generated method stub
		return null;
	}
}
