package com.scau.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.scau.exception.DataAccessException;



/** 采用泛型去完成的对所有实体类和视图类完成对数据库执行CRUD等各种方法的基类
 * @author jianhao
 *
 * @param <T>
 */
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
			logger.info("插入一条"+ entity.getClass().getName() +"已完成。");
		} catch (Exception e) {
			logger.error("插入记录出错！");
			e.printStackTrace();
		}

	}

	/**
	 * @param entity
	 * @throws DataAccessException
	 */
	/**
	 * @param entity
	 * @throws DataAccessException
	 */
	public void delete(T entity) throws DataAccessException {
		if (null == entity) {
			throw new DataAccessException("尝试删除空对象！请至少有一个属性被赋值。entity==null");
		}
		try {
			 hibernateTemplate.delete(entity);
			 logger.info("成功删除实体"+ entity.getClass().getName());
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
			logger.info("成功更新"+ entity.getClass().getName());
		} catch (Exception e) {
			logger.error("更新记录出错！");
			throw new DataAccessException("更新记录出错！");
		}
	}

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

	@Transactional
	public T get(T entity, Long id) {
		return (T) hibernateTemplate.get(entity.getClass(),(Serializable) id);
	}

	public List<T> list(T entity) throws DataAccessException, Exception {
		return hibernateTemplate.findByExample(entity);
	}

	public List<T> listAll(T entity) throws DataAccessException {
		return (List<T>) hibernateTemplate.loadAll(entity.getClass());
	}

	
	/**
	 * @param entity
	 * @param start
	 * @param size 结果的条数
	 * @param propertyNames 查询所需要的属性名
	 * @param values	属性相应的值
	 * @return
	 * @throws DataAccessException
	 */
	@SuppressWarnings("unchecked")
	public List<T> list(final T entity,   final Integer start, final Integer size,String[] propertyNames,Object[] values) 
			throws DataAccessException {
		if(null == propertyNames || null == values){
			propertyNames = new String[0];
			values = new String[0];
		}
		if(propertyNames.length != values.length){
			logger.error("要查询的属性个数和属性值的个数不相等！");
			throw  new DataAccessException("执行分页查询出错！");
		}
		else {
			final DetachedCriteria criteria = DetachedCriteria.forClass(entity.getClass());
			// 加上查询的约束条件
			for(int i = 0 ;i < propertyNames.length;i++ ){
				criteria.add( Property.forName(propertyNames[i]).eq(values[i]) );
			}
			
			// 执行查询
			return (List) hibernateTemplate.execute(new HibernateCallback() {
				  public Object doInHibernate(Session session) { 
					  if(null == start || null == size){
						 return criteria.getExecutableCriteria(session).list();
					  }
					  else{
						  return criteria.getExecutableCriteria(session).setMaxResults(size).setFirstResult(start).list();
					  }
				  }
			});
	
		}
	}

	
	/**
	 * @param entity
	 * @param start
	 * @param size	结果的条数
	 * @param propertyNames 查询所需要的属性名
	 * @param values	属性相应的值
	 * @param orderedProperty 要按次序查询的属性（有先后）
	 * @param orders  相应属性的次序 取值：desc 或asc
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> listByOrder(final T entity,   final Integer start, final Integer size,
			String[] propertyNames,Object[] values,String[] orderedProperty,String orders[]) throws DataAccessException {
		if(null == propertyNames || null == values){
			propertyNames = new String[0];
			values = new String[0];
		}
		if(null == orderedProperty || null == orders){
			orderedProperty = new String[0];
			orders = new String[0];
		}
		if(propertyNames.length != values.length || orderedProperty.length != orders.length){
			logger.error("发生以下错误：1.要查询的属性个数和属性值的个数不相等！\n 2.次序的排序的属性个数与相应的次序个数不相等！");
			throw  new DataAccessException("执行分页查询出错！");
		}
		else {
			final DetachedCriteria criteria = DetachedCriteria.forClass(entity.getClass());
			// 加上查询的约束条件
			for(int i = 0 ;i < propertyNames.length;i++ ){
				criteria.add( Property.forName(propertyNames[i]).eq(values[i]) );
			}
			for(int i = 0 ;i< orderedProperty.length;i++){
				if(orders.equals("desc")){
					criteria.addOrder(Order.desc(orderedProperty[i]));
				}
				else if(orders.equals("asc")){
					criteria.addOrder(Order.asc(orderedProperty[i]));
				}
			}
			// 执行查询
			return (List) hibernateTemplate.execute(new HibernateCallback() {
				  public Object doInHibernate(Session session) { 
					  if(null == start || null == size){
						 return criteria.getExecutableCriteria(session).list();
					  }
					  else{
						  return criteria.getExecutableCriteria(session).setMaxResults(size).setFirstResult(start).list();
					  }
				  }
			});
	
		}
		
	}
	
	public List<T> findByCondition(String queryString) {
		return hibernateTemplate.find(queryString);
	}

	/** 使用支持分页查询的hql查询方式
	 * @param start 定义从第几条开始查询 
	 * @param size 定义返回的记录数 
	 * @param queryString
	 * @return
	 */
	public List<T> findByCondition(final Integer start, final Integer size,final String queryString) {
		   @SuppressWarnings("unchecked")
		List<T> list = hibernateTemplate.executeFind(new HibernateCallback() {  
	             public Object doInHibernate(Session session)  
	             throws HibernateException, SQLException {  
	             org.hibernate.Query query = (org.hibernate.Query) session.createQuery(queryString);  
	             if(null != start || null != size){
	            	 query.setFirstResult(start);//定义从第几条开始查询  
	            	 query.setMaxResults(size);//定义返回的记录数  
	             }
	             List list = query.list();  
	             return list;  
	             }  
	        }); 
		   return list;
	}
	
	public int getRecordCount(T entity) {
		List<T> list;
		try {
			list = this.list(entity);
			return list.size();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
	}

	/** 对实体T内的属性求和
	 * @param sumString
	 * @return
	 */
	public List<Object> getSum(String sumString){
		List<Object> tempList = (List<Object>) this.findByCondition(sumString);//暂时保存结果的列表
		List<Object> resultList = new ArrayList<Object>();
		for(Iterator it=tempList.iterator();it.hasNext();)
		{
			Object t[]=(Object[])it.next();
			for (Object object : t) {
				resultList.add(object);
			}
			//System.out.println(t[0].toString());
		}
		return resultList;
	}
	
	/** 用含count(函数) 的hql语句特定查询记录的数量
	 * @param queryString
	 * @return
	 * @throws Exception
	 */
	public long getRecordCount(String queryString) throws Exception {
		
		return (Long)this.findByCondition(queryString).get(0);
	}
	
	public void batchUpdate(List<T> list) throws DataAccessException {
		for (T object : list) {
			this.update(object);
		}
	}

	public void batchAdd(List<T> list){
		for(T entity:list){
			this.add(entity);
		}
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
