package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;


import com.scau.service.BaseService;
import com.scau.view.goose.TradeGoodView;

@Component
public class TradeGoodViewService extends BaseService<TradeGoodView>{

	@Override
	public TradeGoodView get(TradeGoodView entity) {
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
