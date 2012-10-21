package com.scau.service.impl.goose;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.scau.model.goose.Farmer;
import com.scau.service.BaseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.Market;
import com.scau.vo.goose.AppearOnMarket;
@Component
public class MarketService extends BaseService<Market>{
	private static final int ON_MARKET_DAY = 90;
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
	
	/**
	 *  查看鹅只可上市信息
	 *候选条件：鹅苗接收批次时间在从今天算已养殖45天到105天内
	 * @return
	 */
	public List<AppearOnMarket> getAppearOnMarketList() throws Exception{
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
		String hql =  "select m from com.scau.view.goose.Market m where m.receiveDate between '" + this.getDateBefore(105) + "' and '" +
					this.getDateBefore(45) + "' order by m.receiveDate asc";
		// 以下的计算是找出记录的总数
		List<Market> totalList = this.findByCondition(hql);
		
		List<AppearOnMarket> resourceList = new LinkedList<AppearOnMarket>();
		for (Market market : totalList) {	
			long feedDays = new Date().getTime() - market.getReceiveDate().getTime();//已养殖天数
			long day = ON_MARKET_DAY - feedDays/(3600*24*1000);//离上市相差的天数
			//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
		
			String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + market.getReceiveId() + "' and "
					+ "g.isValid =1 and g.tradeId=null";
			long gooseNum = gooseService.getRecordCount(gooseCondition);
				
			AppearOnMarket a = new AppearOnMarket();
			a.setFarmer(farmerService.get(new Farmer(),market.getFarmerId()));
			a.setDayTo90(day);
			a.setGooseNum(gooseNum);
			a.setMarket(market);
			resourceList.add(a);
		}
		return resourceList;
	}
}
