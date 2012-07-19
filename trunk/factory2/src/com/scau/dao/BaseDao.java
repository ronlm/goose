package com.scau.dao;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.annotation.Scope;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;


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

	public T get(T entity, Long id) {
		try {
			if (null == id) {
				logger.info("ID 为空");
				throw new DataAccessException("ID不存在！");
			} else {
				return (T) hibernateTemplate.get(entity.getClass(),
						(Serializable) id);
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
	 * 查询列表的方法,实现分页查询 注意: entity的属性如果没设置有值并且isQueryAll=true时会查询所有记录!
	 * 
	 * @param entity
	 *            实体对象
	 * @param start
	 *            开始记录的下标
	 * @param size
	 *            要查询返回的数量
	 * @param condition
	 *            条件, 如 order by updateTime desc.如果没有条件则设为"1=1"(含有一空格的字符串)
	 * @param isQueryAll
	 * @return
	 * @throws DataAccessException
	 */
	@SuppressWarnings("unchecked")
	public List<T> list(final T entity, final Integer start,
			final Integer size, final String condition, boolean isQueryAll)
			throws DataAccessException {
				
		List<T> list = hibernateTemplate
				.executeFind(new HibernateCallback<T>() {
					public T doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from "+ entity.getClass().getSimpleName() +" T where "+ condition );
						query.setFirstResult(start);
						query.setMaxResults(size);
						List list = query.list();
						return (T) list;
					}
				});
		return list;
	}

	/**
	 * 使用hql 语句进行操作
	 * 
	 * @param hql
	 *            HSQL 查询语句
	 * @param offset
	 *            开始取数据的下标
	 * @param length
	 *            读取数据记录数
	 * @return List 结果集
	 * 
	 *         public List getListForPage(final String hql, final int offset,
	 *         final int length) {
	 * 
	 *         List list = getHibernateTemplate().executeFind(new
	 *         HibernateCallback() { public Object doInHibernate(Session
	 *         session) throws HibernateException, SQLException { Query query =
	 *         session.createQuery(hql); query.setFirstResult(offset);
	 *         query.setMaxResults(length); List list = query.list(); return
	 *         list; } }); return list; }
	 */

	/*
	 * Connection conn = null; PreparedStatement prmt = null; ResultSet rs =
	 * null; Class entityClass = entity.getClass(); String entityClassName =
	 * entityClass.getName(); // 获得实体类名 String tableName =
	 * Utils.getTableNameFromEntityName
	 * (entityClassName.substring(entityClassName .lastIndexOf('.') + 1));
	 * Field[] field = entityClass.getDeclaredFields(); // 获取实体类的所有字段 String[]
	 * fieldGetterName = Utils.getColumnGetterName(entityClass); // 获取字段值getter名
	 *//** *创建预备查询语句** */
	/*
	 * StringBuilder sql = new StringBuilder("select * from " + tableName +
	 * " where 1=1"); List<T> list = new ArrayList<T>(); try { // 准备基本的sql语句 for
	 * (int i = 0; i < fieldGetterName.length; i++) {// 构造查询字符串 if
	 * (entityClass.getMethod(fieldGetterName[i]).invoke(entity) != null) { //
	 * 如果实体对象字段值不为空 sql.append(" and " + field[i].getName() + "=?"); } } // 排序
	 * if (null != condition) { sql.append(" " + condition); }
	 * 
	 * // 如果需要分布查询 if (null != start && null != size) { sql.append(" limit " +
	 * start + "," + size); }
	 * 
	 * conn = JdbcUtil.getConnection(); prmt =
	 * conn.prepareStatement(sql.toString());
	 *//** **为查询语句设值***** */
	/*
	 * int j = 1;// 预查询语句的设值下标号 for (int i = 0; i < fieldGetterName.length; i++)
	 * { if (entityClass.getMethod(fieldGetterName[i]).invoke(entity) != null) {
	 * // 如果实体对象字段值不为空 Object value =
	 * entityClass.getMethod(fieldGetterName[i]).invoke(entity);
	 * prmt.setObject(j, value); j++; } } // 如果没有一个属性被赋值的话, 会查询全部列表!! //
	 * 所以除非是要查询所有记录, 否则要避免这种情况 if (1 == j && (!isQueryAll)) { //
	 * 如果不是查询全部但没有一个属性被赋值,则抛异常!! logger.error("查询记录出错！sql=" + sql +
	 * ". 请确认: 1.对象的getter方法为public; 2. 如果不是查询所有记录, 请至少有一个属性被赋值."); return list;
	 * } // System.out.print("sql============" + sql + "======"); rs =
	 * prmt.executeQuery(); ResultSetMetaData rsMetaData = rs.getMetaData();
	 * String[] columnSetterName = Utils.getColumnSetterName(entityClass); //
	 * 实体类中字段的设值方法名 list = (List<T>) Utils.setEntityObject(entityClass, rs,
	 * rsMetaData, columnSetterName); } catch (Exception e) { logger
	 * .error("查询记录出错！sql=" + sql +
	 * ". 请确认: 1.对象的getter方法为public; 2.如果不是查询所有记录, 请至少有一个属性被赋值.", e); throw new
	 * DataAccessException("查询记录出错！sql=" + sql +
	 * ". 请确认: 1.对象的getter方法为public; 2.如果不是查询所有记录, 请至少有一个属性被赋值.", e); } finally
	 * { 关闭连接 JdbcUtil.close(prmt, conn); } logger.info("sql=" + sql);
	 * logger.info("成功查询记录。"); return list;
	 */
	// }

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
