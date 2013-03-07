package com.mpupa.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mpupa.dao.IBaseDao;
import com.mpupa.model.TemplateModel;
import com.mpupa.service.ITemplateService;


@Service(value="templateService")
@Transactional
public class TemplateService implements ITemplateService {
	
	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;

	@Override
	public void saveTemplage(TemplateModel templageModel) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<TemplateModel> listTemplate() {
		// TODO Auto-generated method stub
		return null;
	}
	


}
