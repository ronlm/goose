package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Good;
import com.scau.service.BaseService;

@Component
public class GoodService extends BaseService<Good>{
	public void save(Good good) throws BusinessException{
		if (null != good && null != good.getName()) {
			if(null != good.getId() && 0 != good.getId()){
				update(good);
			}else{
				add(good);
			}
		}else {
			throw new BusinessException("物资名不能为空!");
		}
	}
	
	@Override
	public Good get(Good entity) {
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
