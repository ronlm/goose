package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Farm;
import com.scau.service.BaseService;

public class FarmService extends BaseService<Farm>{

	@Override
	public Long add(Farm entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Farm entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Farm> list(Farm entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Farm> listAll(Farm entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Farm> list(Farm entity, Integer start, Integer size,
			String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Farm entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Farm get(Farm entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Farm> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Farm entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Farm> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Farm> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
