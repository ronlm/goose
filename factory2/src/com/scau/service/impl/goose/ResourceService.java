package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Resource;
import com.scau.service.BaseService;

public class ResourceService extends BaseService<Resource>{

	@Override
	public Long add(Resource entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Resource entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Resource> list(Resource entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Resource> listAll(Resource entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Resource> list(Resource entity, Integer start, Integer size,
			String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Resource entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Resource get(Resource entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Resource> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Resource entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Resource> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Resource> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
