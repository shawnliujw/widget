package com.mpupa.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.mpupa.dao.IBaseDao;

@Component(value="myBatisDao")
public class BaseDaoMyBatis extends SqlSessionDaoSupport implements IBaseDao{

	@Override
	public <T> T getObject(String sqlKey, Serializable id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(sqlKey,id);
	}

	@Override
	public <T> T getObject(String sqlKey, Map<String, Object> parms) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(sqlKey, parms);
	}

	@Override
	public List<?> getObjectList(String sqlKey, Map<String, Object> parms) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(sqlKey, parms);
	}

	@Override
	public List<?> getObjectList(String sqlKey) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(sqlKey);
	}

	@Override
	public void saveObject(String sqlKey, Object obj) {
		// TODO Auto-generated method stub
		this.getSqlSession().insert(sqlKey, obj);
	}

	@Override
	public void updateObject(String sqlKey, Object obj) {
		// TODO Auto-generated method stub
		this.getSqlSession().update(sqlKey, obj);
	}

	@Override
	public void deleteObject(String sqlKey, Serializable id) {
		// TODO Auto-generated method stub
		this.getSqlSession().delete(sqlKey, id);
	}

	@Override
	public void deleteObject(String sqlkey, Map<String, Object> parms) {
		// TODO Auto-generated method stub
		this.getSqlSession().delete(sqlkey, parms);
	}

	@Override
	public <T> T getObject(String sqlKey, String parm) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(sqlKey, parm);
	}

	@Override
	public <T> T getObjectList(String sqlKey, String parm) {
		// TODO Auto-generated method stub
		return (T) this.getSqlSession().selectList(sqlKey, parm);
	}


}
