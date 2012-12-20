package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import com.scau.service.BaseService;
import com.scau.view.goose.BuyGoodView;

@Component
public class BuyGoodViewService extends BaseService<BuyGoodView>{

	@Override
	public BuyGoodView get(BuyGoodView entity) {
		//id不为null,更新，为null则add
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
