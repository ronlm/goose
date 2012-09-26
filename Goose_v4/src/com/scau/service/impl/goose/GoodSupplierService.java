package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.comm.CommUser;
import com.scau.model.goose.GoodSupplier;
import com.scau.service.BaseService;

@Component
public class GoodSupplierService extends BaseService<GoodSupplier>{
	@Transactional
	public void save(GoodSupplier entity) throws BusinessException{
		if (null != entity && null != entity.getName()) {
			if(null != entity.getId() && 0 != entity.getId()){
				update(entity);
			}else{
				add(entity);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public GoodSupplier get(GoodSupplier entity) {
		if(null != entity && null != entity.getId() && 0!= entity.getId()){
			return super.get(entity, entity.getId());
		}
		else if(null != entity) {
			return super.get(entity);
		}
		else {
			return null;
		}
	}

}
