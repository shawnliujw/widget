package com.mpupa.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mpupa.dao.IBaseDao;
import com.mpupa.model.ClientModel;
import com.mpupa.service.IClientService;

@Service(value="clientService")
@Transactional
public class ClientServiceImpl implements IClientService{

	@Resource(name = "myBatisDao")
	private IBaseDao myBatisDao;
	
	@Override
	public void saveClient(ClientModel clientModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.saveObject("",clientModel);
	}

	@Override
	public void deleteClient(Serializable clientId) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",clientId);
	}

	@Override
	public void deleteClient(ClientModel clientModel) {
		// TODO Auto-generated method stub
		this.myBatisDao.deleteObject("",clientModel);
	}

	@Override
	public ClientModel getClientById(Serializable clientId) {
		// TODO Auto-generated method stub
		return this.myBatisDao.getObject("",clientId);
	}

	@Override
	public List<ClientModel> listClient() {
		// TODO Auto-generated method stub
		return (List<ClientModel>) this.myBatisDao.getObjectList("");
	}

	@Override
	public void updateClient(ClientModel client) {
		// TODO Auto-generated method stub
		this.myBatisDao.updateObject("",client);
		
	}

}
