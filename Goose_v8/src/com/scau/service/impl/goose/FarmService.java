package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.Farm;
import com.scau.service.BaseService;

@Component
public class FarmService extends BaseService<Farm>{
	@Transactional
	public void save(Farm farm) throws BusinessException{
		if (null != farm && null != farm.getName()) {
			if(null != farm.getId() && 0 != farm.getId()){
				//id不为null,更新，为null则add
				update(farm);
			}else{
				add(farm);
			}
		}else {
			throw new BusinessException("养殖场名不能为空!");
		}
	}
	
	@Override
	public Farm get(Farm entity) {
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
