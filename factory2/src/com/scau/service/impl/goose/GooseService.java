package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Goose;
import com.scau.service.BaseService;

public class GooseService extends BaseService<Goose>{

	@Override
	public Long add(Goose entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Goose entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Goose> list(Goose entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Goose> listAll(Goose entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Goose> list(Goose entity, Integer start, Integer size,
			String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Goose entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Goose get(Goose entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Goose> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Goose entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Goose> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Goose> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
