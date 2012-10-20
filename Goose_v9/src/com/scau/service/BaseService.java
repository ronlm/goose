package com.scau.service;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.DataAccessException;

/** 对 com.scau.dao.BaseDao 的封装，所有的Service类必须继承这一个Service基类
 * @author jianhao
 *
 * @param <T>
 */
@Component
public class BaseService<T> {
	protected BaseDao<T> baseDao = new BaseDao<T>();

	/**
	 * 添加
	 * @param entity
	 */
	@Transactional
	public void add(T entity)  {
		 baseDao.add(entity);
	}
	/**
	 * 批量添加
	 * @param entity
	 */
	@Transactional
	public void batchAdd(List<T> list){
		baseDao.batchAdd(list);
	}
	
	/**
	 * 删除
	 * @param entity
	 */
	@Transactional
	public void delete(T entity)  {
			baseDao.delete(baseDao.get(entity));
	}

	/**
	 * 删除
	 * @param entity
	 * @param id
	 */
	@Transactional
	public void delete(T entity,Long id){
		baseDao.delete(baseDao.get(entity, id));
	}
	
	/**
	 * 获得合符条件的记录
	 * @param entity
	 * @return
	 */
	public List<T> list(T entity)  {
		
		try {
			return baseDao.list(entity);
		} catch (DataAccessException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 列出全部entity
	 * @param entity
	 * @return
	 */
	public List<T> listAll(T entity)  {
		return baseDao.listAll(entity);
	}

	/**
	 * @param entity
	 * @param start
	 * @param size 结果的条数
	 * @param propertyNames 查询所需要的属性名
	 * @param values	属性相应的值
	 * @return
	 */
	public List<T> list(T entity,Integer start, Integer size,String[] propertyNames,Object[] values) {
		return baseDao.list(entity, start, size, propertyNames, values);
	}

	/**
	 * 更新
	 * @param entity
	 */
	@Transactional
	public void update(T entity)  {
		baseDao.update(entity);
	}

	/**
	 * 查找
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return baseDao.get(entity);
	}
	
	/**
	 * 查找
	 * @param entity
	 * @param id
	 * @return
	 */
	public T get(T entity,Long id) {
		return baseDao.get(entity,id);
	}
	
	/**
	 * 使用Hql查找
	 * @param queryString
	 * @return
	 */
	public List<T> findByCondition(String queryString){
		return baseDao.findByCondition(queryString);
	}
	
	/*
	 * 用hql的分页查找
	 */
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
	
	
	/** 对实体T内的属性求和
	 * @param sumString
	 * @return
	 */
	public List<Object> getSum(String sumString){
		List<Object> resultList = (List<Object>) baseDao.getSum(sumString);
		return resultList;
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
