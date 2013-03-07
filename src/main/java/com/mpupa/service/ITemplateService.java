package com.mpupa.service;

import java.util.List;

import com.mpupa.model.TemplateModel;

public interface ITemplateService {
	
	/**
	 * save();
	 * @param templageModel
	 * 2012-9-26 下午3:49:13
	 * @author Claire
	 */
	void saveTemplage(TemplateModel templageModel);
	/**
	 * 
	 * @return
	 * 2012-9-28 下午12:04:14
	 * @author Claire
	 */
	List<TemplateModel> listTemplate();

}
