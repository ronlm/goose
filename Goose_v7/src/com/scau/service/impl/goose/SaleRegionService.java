package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.comm.CommUser;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.SaleRegion;
import com.scau.service.BaseService;

@Component
public class SaleRegionService extends BaseService<SaleRegion>{
	@Transactional
	public void save(SaleRegion entity) throws BusinessException{
		if (null != entity && null != entity.getRegion()) {
			if(null != entity.getId() && 0 != entity.getId()){
				update(entity);
			}else{
				add(entity);
			}
		}else {
			throw new BusinessException("销售区域名不能为空!");
		}
	}

	@Override
	public SaleRegion get(SaleRegion entity) {
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
