package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.OfferModel;
import com.mpupa.service.IOfferService;
import com.mpupa.utils.WebAppUtil;

@Service(value="offerService")
@Transactional
public class OfferServiceImpl implements IOfferService{

	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveOffer(OfferModel clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOffer(Serializable clientId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOffer(OfferModel clientModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OfferModel getOfferById(Serializable clientId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("OfferId", clientId);
		return this.myBatisDao.getObject("com.mpupa.model.offer.getOfferByOfferId", map);
	}

	@Override
	public List<OfferModel> listOffer() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOffer(OfferModel offerModel) {
		// TODO Auto-generated method stub
		
	}
	

}
