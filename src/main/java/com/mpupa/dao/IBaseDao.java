package com.mpupa.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IBaseDao {

	/**
	 * 更具主键Id取得唯一的对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:09:30
	 */
	<T> T getObject(String sqlKey, Serializable id);
	/**
	 * 根据某个条件Id取得唯一的对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:09:30
	 */
	<T> T getObject(String sqlKey, String parm);
	
	/**
	 * 根据多个参数取得唯一的 object
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午2:50:27
	 */
	<T> T getObject(String sqlKey, Map<String,Object> parms);
	
	/**
	 * 根据参数 取得 object list
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午2:51:38
	 */
	List<?> getObjectList(String sqlKey, Map<String,Object> parms);
	
	/**
	 * 取得多个对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:07:20
	 */
	List<?> getObjectList(String sqlKey);
	
	/**
	 * 根据某个条件取得多个对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:09:30
	 */
	<T> T getObjectList(String sqlKey, String parm);
	
	/**
	 * 保存一个对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:08:00
	 */
	void saveObject(String sqlKey, Object obj);
	
	/**
	 * 更新一个对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:08:24
	 */
	void updateObject(String sqlKey, Object obj);
	
	/**
	 * 根据主键Id删除一个对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:10:44
	 */
	void deleteObject(String sqlKey,Serializable id);
	
	/**
	 * 根据多个条件删除一个或者多个对象
	 *
	 * @author shawn
	 * @date 2012 2012-6-17 下午3:10:41
	 */
	void deleteObject(String sqlkey,Map<String, Object> parms);
}
