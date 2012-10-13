package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;

import com.scau.service.BaseService;
import com.scau.view.goose.Market;
@Component
public class MarketService extends BaseService<Market>{
	
	@Override
	public Market get(Market entity) {
		if(null != entity && null != entity.getReceiveId() && 0!= entity.getReceiveId()){
			return super.get(entity, entity.getReceiveId());
		}
		else if(null != entity) {
			return super.get(entity);
		}
		else {
			return null;
		}
	}
}
