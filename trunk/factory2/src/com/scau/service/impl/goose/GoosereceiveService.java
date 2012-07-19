package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Goosereceive;
import com.scau.service.BaseService;

public class GoosereceiveService extends BaseService<Goosereceive>{

	@Override
	public Long add(Goosereceive entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Goosereceive entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Goosereceive> list(Goosereceive entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Goosereceive> listAll(Goosereceive entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Goosereceive> list(Goosereceive entity, Integer start,
			Integer size, String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Goosereceive entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Goosereceive get(Goosereceive entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Goosereceive> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Goosereceive entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Goosereceive> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Goosereceive> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
