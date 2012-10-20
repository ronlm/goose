package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.TradeGood;
import com.scau.service.BaseService;

@Component
public class TradeGoodService extends BaseService<TradeGood>{
	@Transactional
	public void save(TradeGood entity) throws BusinessException{
		if (null != entity) {
			//id不为null,更新，为null则add
			if( null!= entity.getId() && 0 != entity.getId()){
				update(entity);
			}else{
				add(entity);
			}
		}else {
			throw new BusinessException("物资销售Id不能为空!");
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
