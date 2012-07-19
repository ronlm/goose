package com.scau.service.impl.goose;

import java.util.List;

import com.scau.dao.BaseDao;
import com.scau.model.goose.Goosetrade;
import com.scau.service.BaseService;

public class GoosetradeService extends BaseService<Goosetrade>{

	@Override
	public Long add(Goosetrade entity) {
		// TODO Auto-generated method stub
		return super.add(entity);
	}

	@Override
	public void delete(Goosetrade entity) {
		// TODO Auto-generated method stub
		super.delete(entity);
	}

	@Override
	public List<Goosetrade> list(Goosetrade entity) throws Exception {
		// TODO Auto-generated method stub
		return super.list(entity);
	}

	@Override
	public List<Goosetrade> listAll(Goosetrade entity) {
		// TODO Auto-generated method stub
		return super.listAll(entity);
	}

	@Override
	public List<Goosetrade> list(Goosetrade entity, Integer start,
			Integer size, String condition, boolean isQueryAll) {
		// TODO Auto-generated method stub
		return super.list(entity, start, size, condition, isQueryAll);
	}

	@Override
	public void update(Goosetrade entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public Goosetrade get(Goosetrade entity) {
		// TODO Auto-generated method stub
		return super.get(entity);
	}

	@Override
	public List<Goosetrade> findByCondition(String queryString) {
		// TODO Auto-generated method stub
		return super.findByCondition(queryString);
	}

	@Override
	public int getRecordCount(Goosetrade entity) {
		// TODO Auto-generated method stub
		return super.getRecordCount(entity);
	}

	@Override
	public BaseDao<Goosetrade> getBaseDao() {
		// TODO Auto-generated method stub
		return super.getBaseDao();
	}

	@Override
	public void setBaseDao(BaseDao<Goosetrade> baseDao) {
		// TODO Auto-generated method stub
		super.setBaseDao(baseDao);
	}
	
}
