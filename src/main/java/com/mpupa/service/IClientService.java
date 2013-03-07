package com.mpupa.service;

import java.io.Serializable;
import java.util.List;

import com.mpupa.model.ClientModel;

public interface IClientService {

	/**
	 * save <code>ClientModel</code> object to database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:25
	 */
	void saveClient(ClientModel clientModel);
	/**
	 * delete ClientModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteClient(Serializable clientId);
	/**
	 * delete ClientModel object from database
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:08:56
	 */
	void deleteClient(ClientModel clientModel);
	
	/**
	 * get ClientModel object by clientId
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:12:17
	 */
	ClientModel getClientById(Serializable clientId);
	
	/**
	 * get all ClientModel objects
	 *
	 * @author shawn
	 * @date 2012 2012-9-15 下午9:14:57
	 */
	List<ClientModel> listClient();
	/**
	 * 
	 * update()
	 */
	void updateClient(ClientModel client);
}
