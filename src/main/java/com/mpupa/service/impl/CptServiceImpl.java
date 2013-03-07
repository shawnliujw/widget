/**
 * 
 */
package com.mpupa.service.impl;

import java.util.List;

import javax.annotation.Resource;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.CptModel;
import com.mpupa.service.ICptService;

/**
 * @author 
 *
 */
@Transactional
@Service(value = "cptService")
public class CptServiceImpl implements ICptService {
	Logger logger = Logger.getLogger(CptServiceImpl.class);
	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;
	@Override
	public void saveCpt(CptModel CptModel) {
		this.myBatisDao.updateObject("com.mpupa.model.cpt.insertCpt", CptModel);
	}

	@Override
	public CptModel getCouponEmail(String email) {
		CptModel cm=(CptModel)this.myBatisDao.getObject("com.mpupa.model.cpt.getCoupleEmail", email);
		return cm;
	}
	
}
