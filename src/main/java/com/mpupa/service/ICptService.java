/**
 * 
 */
package com.mpupa.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.mpupa.model.BrandModel;
import com.mpupa.model.CptModel;
import com.mpupa.model.OfferModel;

/**
 * @author 
 *
 */
public interface ICptService {
	
	
	void saveCpt(CptModel CptModel);
	
	CptModel getCouponEmail(String email);
}
