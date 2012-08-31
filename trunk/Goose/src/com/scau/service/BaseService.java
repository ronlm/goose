package com.scau.service;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.com.ege.mvc.exception.DataAccessException;

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

	public List<T> list(T entity)  {
		
		try {
			return baseDao.list(entity);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
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
	
	public  List<T> findByCondition(Integer start, Integer size,String queryString){
		return baseDao.findByCondition(start, size, queryString);
	}
	
	/** 按输入的属性值获取记录，按一定的顺序排序
	 * @param entity
	 * @param start
	 * @param size
	 * @param propertyNames
	 * @param values
	 * @param orderedProperty 要排序的属性
	 * @param orders 相应的顺序，只能写asc或desc
	 * @return
	 */
	public List<T> listByOrder(final T entity,   final Integer start, final Integer size,
			String[] propertyNames,Object[] values,String[] orderedProperty,String orders[]){
		return baseDao.listByOrder(entity, start, size, propertyNames, values, orderedProperty, orders);
	}
	
	/** 获取记录的总数
	 * @param entity
	 * @return
	 * @throws Exception 
	 */
	public int getRecordCount(T entity) {
		return this.baseDao.getRecordCount(entity);
	}

	/**用含count(函数) 的hql语句特定查询记录的条数
	 * @param queryString
	 * @return
	 * @throws Exception
	 */
	public long getRecordCount(String queryString) throws Exception{
		return this.baseDao.getRecordCount(queryString);
	}
	
	public BaseDao<T> getBaseDao() {
		return baseDao;
	}

	@Resource
	public void setBaseDao(BaseDao<T> baseDao) {
		this.baseDao = baseDao;
	}
	
	
	/**取得与今天相隔n天的那个时间（YY:MM:DD）
	 * @param daysBefore 与今天相隔的天数，当为负数时，返回1970：01：01
	 * @return
	 */
	public  Date getDateBefore(long daysBefore){
			if(daysBefore < 0){
				return new Date(0);
			}
			else {
				long millisecondsInterval = daysBefore * 24 * 3600 * 1000;
				java.util.Date today = new java.util.Date();
				Date tar = new Date(today.getTime() - millisecondsInterval);
				return tar;	
			}
		}
}
