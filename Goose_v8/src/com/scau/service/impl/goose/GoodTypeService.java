package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.comm.CommUser;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.GoodType;
import com.scau.model.goose.SaleRegion;
import com.scau.service.BaseService;

@Component
public class GoodTypeService extends BaseService<GoodType>{
	@Transactional
	public void save(GoodType entity) throws BusinessException{
		if (null != entity && null != entity.getName()) {
			if(null != entity.getId() && 0 != entity.getId()){
				//id不为null,更新，为null则add
				update(entity);
			}else{
				add(entity);
			}
		}else {
			throw new BusinessException("销售区域名不能为空!");
		}
	}

	@Override
	public GoodType get(GoodType entity) {
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
