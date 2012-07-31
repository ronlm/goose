package com.scau.service;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.scau.dao.BaseDao;

@Component
public class BaseService<T> {
	protected BaseDao<T> baseDao = new BaseDao<T>();

	@Transactional
	public void add(T entity)  {
		 baseDao.add(entity);
	}

	@Transactional
	public void batchAdd(List<T> list){
		baseDao.batchAdd(list);
	}
	
	@Transactional
	public void delete(T entity)  {
			baseDao.delete(entity);
	}

	public List<T> list(T entity) throws Exception  {
		
		return baseDao.list(entity);
	}
	
	public List<T> listAll(T entity)  {
		return baseDao.listAll(entity);
	}

	public List<T> list(T entity,Integer start, Integer size,String[] propertyNames,Object[] values) {
		return baseDao.list(entity, start, size, propertyNames, values);
	}


	@Transactional
	public void update(T entity)  {
		baseDao.update(entity);
	}

	public T get(T entity) {
		return baseDao.get(entity);
	}
	
	public T get(T entity,Long id) {
		return baseDao.get(entity,id);
	}
	
	public List<T> findByCondition(String queryString){
		return baseDao.findByCondition(queryString);
	}
	
	public int getRecordCount(T entity) {
		return this.baseDao.getRecordCount(entity);
	}

	public BaseDao<T> getBaseDao() {
		return baseDao;
	}

	@Resource
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}
	
	
	/**取得与今天相隔n天的那个时间（YY:MM:DD）
	 * @param daysBefore 与今天相隔的天数
	 * @return
	 */
	public static Date getDaysBefore(int daysBefore){
			int millisecondsInterval = daysBefore * 24 * 3600 * 1000;
			java.util.Date today = new java.util.Date();
			Date tar = new Date(today.getTime() - millisecondsInterval);
			return tar;	
		}
}
