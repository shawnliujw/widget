package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.OfferModel;

public interface IOfferService {

	/**
	 * save <code>OfferModel</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:25
	 */
	void saveOffer(OfferModel clientModel);
	
	/**
	 * delete OfferModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteOffer(Serializable clientId);
	
	/**
	 * delete OfferModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteOffer(OfferModel clientModel);
	
	/**
	 * get OfferModel object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:12:17
	 */
	OfferModel getOfferById(Serializable clientId);
	
	/**
	 * get all OfferModel objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:14:57
	 */
	List<OfferModel> listOffer();
	void updateOffer(OfferModel offerModel);
}
