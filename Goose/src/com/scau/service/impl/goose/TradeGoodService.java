package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.goose.TradeGood;
import com.scau.service.BaseService;

@Component
public class TradeGoodService extends BaseService<TradeGood>{
	
	public void save(TradeGood entity) throws BusinessException{
		if (null != entity ) {
			if(null != entity.getGoodId() && null != entity.getFarmerId()){
				if( null != entity.getId()){
					update(entity);
				}else{
					add(entity);
				}
			}
		}else {
			throw new BusinessException("农用资源名不能为空!");
		}
	}

	@Override
	public TradeGood get(TradeGood entity) {
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
