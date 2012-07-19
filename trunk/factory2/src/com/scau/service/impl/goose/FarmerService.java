package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Farmer;
import com.scau.service.BaseService;

public class FarmerService extends BaseService<Farmer>{

	@Override
	public Long add(Farmer entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Farmer entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Farmer> list(Farmer entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Farmer> listAll(Farmer entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Farmer> list(Farmer entity, Integer start, Integer size,
			String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Farmer entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Farmer get(Farmer entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Farmer> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Farmer entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Farmer> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Farmer> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
