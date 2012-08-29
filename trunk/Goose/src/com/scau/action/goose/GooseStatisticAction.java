package com.scau.action.goose;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.goose.vo.AppearOnMarket;
import com.scau.goose.vo.DeadInfo;
import com.scau.goose.vo.FarmStock;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.MarketService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;
import com.scau.view.goose.Market;

@Component
@Scope("prototype")
public class GooseStatisticAction extends BaseAction {
	private final static Log logger = LogFactory
			.getLog(GooseStatisticAction.class);
	private PageController pager;
	private MarketService marketService;
	private GooseService gooseService;
	private Goose goose;
	private int onMarketDay = 90;//设定的鹅只成熟日期
	private int interval = 15;
	private ReceiveGooseService receiveGooseService;
	
	public String market() {
		String URL = request.getRequestURI();
		this.pager.setURL(URL);

		/* 查看鹅只可上市信息
		 *候选条件：从本日起全部 离90 + 15 天内的鹅苗接收批次的鹅只 		
		*/
		String hql = "select m from com.scau.view.goose.Market m where m.receiveDate >='"
				+ marketService.getDateBefore(onMarketDay + interval )+ "' order by m.receiveDate asc";
		// 以下的计算是找出记录的总数
		List<Market> totalList = marketService.findByCondition(hql);
		List<AppearOnMarket> totalAppearOnMarkets = new ArrayList<AppearOnMarket>();
		Date today = new Date(new java.util.Date().getTime());
		for (Market market : totalList) {	
			long difference= today.getTime() - market.getReceiveDate().getTime();//已养殖天数
			long day = onMarketDay - difference/(3600*24*1000);//离上市相差的天数
			//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
			goose = new Goose();
			goose.setReceiveId(market.getReceiveId());
			goose.setIsValid(1);
			int gooseNum = gooseService.list(goose).size();
				
			// 只显示30天内可上市的批次
			if( !checkTraded(market.getReceiveId()) && day < 30){
				AppearOnMarket a = new AppearOnMarket();
				a.setDayTo90(day);
				a.setGooseNum(gooseNum);
				a.setMarket(market);
				totalAppearOnMarkets.add(a);
			}
		}
			
		int totalRows = totalAppearOnMarkets.size();// 总的记录条数
		this.pager.setTotalRowsAmount(totalRows);
		List<Market> mList = marketService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(), hql);
		
		//计算各个批次离今天相差的应上市天数,应上市的鹅只数
		List<AppearOnMarket> resourceList = new ArrayList<AppearOnMarket>();
		for (Market market : mList) {	
			long difference= today.getTime() - market.getReceiveDate().getTime();//已养殖天数
			long day = onMarketDay - difference/(3600*24*1000);//离上市相差的天数
				
			//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
			goose = new Goose();
			goose.setReceiveId(market.getReceiveId());
			goose.setIsValid(1);
			int gooseNum = gooseService.list(goose).size();
				
			// 只显示30天内可上市的批次
				if( !checkTraded(market.getReceiveId()) && day < 30){
				AppearOnMarket a = new AppearOnMarket();
				a.setDayTo90(day);
				a.setGooseNum(gooseNum);
				a.setMarket(market);
				resourceList.add(a);
			}
		}
			
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("today", new Date(new java.util.Date().getTime()));
			return "market";
	} 

	public String stock(){
			// 查看全部农场的存栏量
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			
			FarmService farmService = (FarmService) BeansUtil.get("farmService");
			int totalRowCount = farmService.list(new Farm()).size();
			this.pager.setTotalRowsAmount(totalRowCount);
			List<Farm> farmList = farmService.findByCondition(pager.getPageStartRow(),pager.getPageSize(),"from com.scau.model.goose.Farm f order by f.id asc");
			
			List<FarmStock> resourceList = new ArrayList<FarmStock>();
			for(Farm f :farmList){
				//找出所有属于某个农场的所有接收鹅苗
				ReceiveGoose rg = new ReceiveGoose();
				rg.setFarmId(f.getId());	
				List<ReceiveGoose>	receiveList = receiveGooseService.list(rg);
				int gooseNum = 0;
				for(ReceiveGoose receiveGoose : receiveList){
					//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
					goose = new Goose();
					goose.setReceiveId(receiveGoose.getId());
					goose.setIsValid(1);
					gooseNum = gooseNum + gooseService.list(goose).size();
				}
				FarmStock stock = new FarmStock();
				stock.setFarm(f);
				stock.setStock(gooseNum);
				resourceList.add(stock);
			}
			
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("today", new Date(new java.util.Date().getTime()));
			return "stock";
	}
		
	public String dead() {
			// 查看鹅只非正常死亡信息
		   	int daysWithin = 100;
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			FarmService farmService = (FarmService) BeansUtil.get("farmService");
			
			// 取得要显示的日期条件
			if(null != request.getParameter("daysWithin")){
					daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
					request.getSession().removeAttribute("daysWithin");
			}else if(null != request.getSession().getAttribute("daysWithin")){
					daysWithin = (Integer)request.getSession().getAttribute("daysWithin");
			}
			
			int totalRowCount = farmService.list(new Farm()).size();
			this.pager.setTotalRowsAmount(totalRowCount);//设置总记录条数
			
			List<Farm> farmList = farmService.findByCondition(pager.getPageStartRow(),pager.getPageSize(),"from com.scau.model.goose.Farm f order by f.id asc");
			List<DeadInfo> resourceList = new ArrayList<DeadInfo>();// 结果列
			for(Farm f:farmList){
				//查找每个农场的相关信息
				List<ReceiveGoose> receiveGooseList = receiveGooseService.findByCondition("from com.scau.model.goose.ReceiveGoose rg where"
						+ " rg.farmId='" + f.getId() +"' and rg.receiveDate >='" + receiveGooseService.getDateBefore(daysWithin) +"'");
				if(receiveGooseList.size() > 0){
					DeadInfo dead = new DeadInfo();
					dead.setFarm(f);
					List<Goose> gooseList = new ArrayList<Goose>();
					for(ReceiveGoose rg:receiveGooseList){
						// 得到一个批次的死亡鹅只死亡记录
						Goose g = new Goose();
						g.setReceiveId(rg.getId());
						g.setIsValid(0);
						List<Goose> tempList = gooseService.list(g);
						
						gooseList.addAll(tempList);
					}
					dead.setDeadNum(gooseList.size());
					dead.setDeadGooses(gooseList);
					resourceList.add(dead);// 加入到结果
				}
			}
			
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("today", new Date(new java.util.Date().getTime()));
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "dead";
	}
		
	

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public GooseService getGooseService() {
		return gooseService;
	}

	@Resource
	public void setGooseService(GooseService gooseService) {
		this.gooseService = gooseService;
	}

	public MarketService getMarketService() {
		return marketService;
	}

	@Resource
	public void setMarketService(MarketService marketService) {
		this.marketService = marketService;
	}

	/** 检查该批次的鹅只是否已被收购
	 * @param receiveId
	 * @return true:已经被公司收购 false:还在农户手中
	 */
	public boolean checkTraded(long receiveId){
		//选出该批次还存活的鹅只
		String queryStr = "select g from com.scau.model.goose.Goose g where g.receiveId=" + receiveId +
				" and g.isValid= 1";
		List<Goose> gList = gooseService.findByCondition(queryStr);
		for(int i = 0 ;i<gList.size();){
			if( null != gList.get(i).getTradeId()){
				return true;
			}
			i = i + 3;
		}
		return false;
	}

	public ReceiveGooseService getReceiveGooseService() {
		return receiveGooseService;
	}

	@Resource
	public void setReceiveGooseService(ReceiveGooseService receiveGooseService) {
		this.receiveGooseService = receiveGooseService;
	}
	
}
