package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.TradeGoose;
import com.scau.service.BaseService;

@Component
public class TradeGooseService extends BaseService<TradeGoose>{
	@Transactional
	public void save(TradeGoose tradeGoose) throws BusinessException{
		if (null != tradeGoose && null != tradeGoose.getFarmId()) {
			//id不为null,更新，为null则add
			if(null != tradeGoose.getId() && 0 != tradeGoose.getId()){
				update(tradeGoose);
			}else{
				add(tradeGoose);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public TradeGoose get(TradeGoose entity) {
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
