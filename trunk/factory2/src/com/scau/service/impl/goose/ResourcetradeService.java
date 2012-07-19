package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Resourcetrade;
import com.scau.service.BaseService;

public class ResourcetradeService extends BaseService<Resourcetrade>{

	@Override
	public Long add(Resourcetrade entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Resourcetrade entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Resourcetrade> list(Resourcetrade entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Resourcetrade> listAll(Resourcetrade entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Resourcetrade> list(Resourcetrade entity, Integer start,
			Integer size, String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Resourcetrade entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Resourcetrade get(Resourcetrade entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Resourcetrade> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Resourcetrade entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Resourcetrade> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Resourcetrade> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
