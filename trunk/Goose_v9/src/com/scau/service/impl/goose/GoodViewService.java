package com.scau.service.impl.goose;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Good;
import com.scau.service.BaseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.GoodView;

@Component
public class GoodViewService extends BaseService<GoodView>{
	
	@Override
	public GoodView get(GoodView entity) {
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
	
	/**
	 * 计算所有物资的当前库存
	 * @param entity
	 * @return
	 */
	public long currentStock(GoodView entity){
		BuyGoodService buyGoodService = (BuyGoodService) BeansUtil.get("buyGoodService");
		TradeGoodService tradeGoodService = (TradeGoodService) BeansUtil.get("tradeGoodService");
		List<Object> totalBuyGoodAmount = buyGoodService.getSum("select sum(bg.amount),bg from com.scau.model.goose.BuyGood bg where bg.goodId=" + entity.getId());
		List<Object> totalTradeGoodAmount = tradeGoodService.getSum("select sum(tg.amount),tg from com.scau.model.goose.TradeGood tg where tg.goodId=" + entity.getId());
		long totalBuyGood = 0 ,totalTradeGood = 0;
		if(null != totalBuyGoodAmount.get(0)){
			totalBuyGood = (Long) totalBuyGoodAmount.get(0);
		}
		if(null != totalTradeGoodAmount.get(0)){
			totalTradeGood = (Long) totalTradeGoodAmount.get(0);
		}
		
		return totalBuyGood - totalTradeGood;
				
	}
}
