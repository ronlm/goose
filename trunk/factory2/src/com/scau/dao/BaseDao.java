package com.scau.dao;

import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.FinderException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.sun.org.apache.regexp.internal.recompile;

import cn.com.ege.mvc.exception.DataAccessException;

@Component
@Scope("prototype")
public class BaseDao<T> {

	protected HibernateTemplate hibernateTemplate;

	private final static Log logger = LogFactory.getLog(BaseDao.class);

	/**
	 * 新增记录
	 * 
	 * @param entity
	 * @return 返回新增记录在数据库是自增的字段值
	 * @throws DataAccessException
	 */
	public void add(T entity) throws DataAccessException {
		if (null == entity) {
			throw new DataAccessException("尝试插入空记录！entity==null");
		}
		try {
			hibernateTemplate.save(entity);
			logger.info("插入已完成。");
		} catch (Exception e) {
			logger.error("插入记录出错！");
			e.printStackTrace();
		}

	}

	public void delete(T entity) throws DataAccessException {
		if (null == entity) {
			throw new DataAccessException("尝试删除空对象！请至少有一个属性被赋值。entity==null");
		}
		try {
			hibernateTemplate.delete(entity);
			logger.info("成功删除");
		} catch (Exception e) {
			logger.error("删除记录出错！");
			e.printStackTrace();
			// throw new DataAccessException("删除记录出错！");
		}
	}

	public void update(T entity) throws DataAccessException {
		if (null == entity) {
			throw new DataAccessException("尝试更新空对象！请至少对id属性设置值。entity==null");
		}
		try {
			hibernateTemplate.saveOrUpdate(entity);
			logger.info("成功更新");
		} catch (Exception e) {
			logger.error("更新记录出错！");
			throw new DataAccessException("更新记录出错！");
		}
	}

	/**
	 * 查询单个对象
	 * 
	 * @param entity
	 * @return 一个对象. 如果全部属性没有一个设置值的话,则返回null
	 * @throws Exception
	 * @throws DataAccessException
	 */
	public T get(T entity) {
		try {
			if (list(entity).size() == 0 || null == list(entity)) {
				return null;
			} else {
				return list(entity).get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public T get(T entity,Long id){
		try {
			if (null == id ) {
				logger.info("ID 为空");
				throw new DataAccessException("ID不存在！");
			} else {
				return (T) hibernateTemplate.get(entity.getClass(), (Serializable)id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<T> list(T entity) throws DataAccessException, Exception {
		return hibernateTemplate.findByExample(entity);
	}

	public List<T> listAll(T entity) throws DataAccessException {
		return (List<T>) hibernateTemplate.loadAll(entity.getClass());
	}

	/**
	 * 查询列表的方法 注意: entity的属性如果没设置有值并且isQueryAll=true时会查询所有记录!
	 * 
	 * @param entity
	 *            实体对象
	 * @param start
	 *            开始记录的位置
	 * @param size
	 *            要查询返回的数量
	 * @param condition
	 *           hql 查询语句
	 * @param isQueryAll
	 * @return
	 * @throws DataAccessException
	 */
	@SuppressWarnings("unchecked")
	public List<T> list(T entity, final Integer start, final Integer size,
			final String condition, boolean isQueryAll) throws DataAccessException {
		if (isQueryAll) {
			return listAll(entity);
		} else {
			@SuppressWarnings("unchecked")
			List<T> list = getHibernateTemplate().executeFind(new HibernateCallback() {
						public Object doInHibernate(Session session)throws HibernateException, SQLException {
							Query query = session.createQuery(condition);
							query.setFirstResult(start);
							query.setMaxResults(size);
							List list = query.list();
							return list;
						}
					});
			return list;
		}
		
	}


	public List<T> findByCondition(String queryString) {
		return hibernateTemplate.find(queryString);
	}

	public int getRecordCount(T entity) throws DataAccessException {
		List<T> list = this.listAll(entity);
		return list.size();
	}

	public void batchUpdate(List<T> list) throws DataAccessException {
		for (T object : list) {
			this.update(object);
		}
	}

	public static Long getSum(String field, String entityName, String condition) {
		return (long) 0;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
