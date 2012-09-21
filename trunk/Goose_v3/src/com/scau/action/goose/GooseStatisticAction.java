package com.scau.action.goose;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.GoodType;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.model.goose.SaleRegion;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GoodTypeService;
import com.scau.service.impl.goose.GooseService;
import com.scau.service.impl.goose.MarketService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.service.impl.goose.SaleRegionService;
import com.scau.service.impl.goose.TradeGoodViewService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;
import com.scau.view.goose.Market;
import com.scau.view.goose.TradeGoodView;
import com.scau.vo.goose.AppearOnMarket;
import com.scau.vo.goose.DeadDetail;
import com.scau.vo.goose.DeadInfo;
import com.scau.vo.goose.FarmStock;

@Component
@Scope("prototype")
public class GooseStatisticAction extends BaseAction {
	private final static Log logger = LogFactory
			.getLog(GooseStatisticAction.class);
	private PageController pager;
	private MarketService marketService;
	private FarmService farmService;
	private GooseService gooseService;
	private static int ON_MARKET_DAY = 90;//设定的鹅只成熟日期
	private ReceiveGooseService receiveGooseService;
	private Farm farm;
	private int daysWithin;
	private Farmer selectedFarmer;
	private FarmerService farmerService;
	private TradeGoodViewService tradeGoodViewService;
	
	public String market() throws Exception{
		String URL = request.getRequestURI();
		this.pager.setURL(URL);

		/* 查看鹅只可上市信息
		 *候选条件：鹅苗接收批次时间在从今天算已养殖45天到105天内
		*/
		String hql =  "select m from com.scau.view.goose.Market m where m.receiveDate between '" + marketService.getDateBefore(105) + "' and '" +
					marketService.getDateBefore(45) + "' order by m.receiveDate asc";
		// 以下的计算是找出记录的总数
		List<Market> totalList = marketService.findByCondition(hql);
		List<AppearOnMarket> totalAppearOnMarkets = new LinkedList<AppearOnMarket>();
		Date today = new Date(new java.util.Date().getTime());
		for (Market market : totalList) {	
			long feedDays = today.getTime() - market.getReceiveDate().getTime();//已养殖天数
			long day = ON_MARKET_DAY - feedDays/(3600*24*1000);//离上市相差的天数
			//查找出属于该个接收鹅苗批次，又未死亡和未交易的鹅只数量
		
			String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + market.getReceiveId() + "' and "
					+ "g.isValid ='1' and g.tradeId=null";
			long gooseNum = gooseService.getRecordCount(gooseCondition);
				
			AppearOnMarket a = new AppearOnMarket();
			a.setDayTo90(day);
			a.setGooseNum(gooseNum);
			a.setMarket(market);
			totalAppearOnMarkets.add(a);
		}
			
		int totalRows = totalAppearOnMarkets.size();// 总的记录条数
		this.pager.setTotalRowsAmount(totalRows);
		
		int toIndex = totalAppearOnMarkets.size() <= pager.getPageStartRow() + pager.getPageSize() ? totalAppearOnMarkets.size() : pager.getPageStartRow() + pager.getPageSize();
		List<AppearOnMarket> resourceList = totalAppearOnMarkets.subList(this.pager.getPageStartRow(), toIndex);
			
		pager.setData(resourceList);
		request.setAttribute("pager", pager);
		request.setAttribute("today", new Date(new java.util.Date().getTime()));
		return "market";
	} 

	/**
	 * @return
	 */
	public String stock() throws Exception{
			// 查看全部农场的存栏量
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			int totalRowCount = farmService.list(new Farm()).size();
			this.pager.setTotalRowsAmount(totalRowCount);
			List<Farm> farmList = farmService.findByCondition(pager.getPageStartRow(),pager.getPageSize(),"from com.scau.model.goose.Farm f order by f.id asc");
			
			List<FarmStock> resourceList = new LinkedList<FarmStock>();
			for(Farm f :farmList){
				
				//找出所有属于某个农场的所有接收鹅苗批次:接收日期在今天的200天之内（打死你也不相信养一个鹅200天 + 吧）
				String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + f.getId()
						+" and rg.receiveDate >='" + receiveGooseService.getDateBefore(200) + "' order by rg.receiveDate desc";
				List<ReceiveGoose>	receiveList = receiveGooseService.findByCondition(hql);
				
				long gooseNum = 0;
				for(ReceiveGoose receiveGoose : receiveList){
					String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + receiveGoose.getId() + "' and "
							+ "g.isValid ='1' and g.tradeId=null";
					gooseNum += gooseService.getRecordCount(gooseCondition);
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
	
	public String stockAndGood() throws Exception{
		//对比当前农户所有鹅的存栏量与物资（饲料）购买记录
		GoodTypeService goodTypeService = (GoodTypeService) BeansUtil.get("goodTypeService");
		int totalStock = 0;
		int totalGood = 0;
		if(null != request.getParameter("daysWithin")){
			daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
			request.getSession().removeAttribute("daysWithin");
		}
		else if(null != request.getSession().getAttribute("daysWithin")){
			daysWithin = (Integer)request.getSession().getAttribute("daysWithin");
		}
		
		selectedFarmer = farmerService.get(selectedFarmer);
		if(null != selectedFarmer){
			//先计算农户名下所有农场的存栏数
			Farm farm = new Farm();
			farm.setFarmerId(selectedFarmer.getId());
			List<Farm> farmList = farmService.list(farm);
			List<FarmStock> stockList = new LinkedList<FarmStock>();//new ArrayList<FarmStock>();
			for (Farm f : farmList) {
				//找出所有属于某个农场的所有接收鹅苗批次:接收日期在今天的200天之后（打死你也不相信养一个鹅200天 + 吧）
				String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + f.getId()
						+" and rg.receiveDate >='" + receiveGooseService.getDateBefore(200) + "' order by rg.receiveDate desc";
				List<ReceiveGoose>	receiveList = receiveGooseService.findByCondition(hql);
				
				long gooseNum = 0;
				for(ReceiveGoose receiveGoose : receiveList){
					String gooseCondition = "select count(*) from com.scau.model.goose.Goose g where g.receiveId='" + receiveGoose.getId() + "' and "
							+ "g.isValid ='1' and g.tradeId=null";
					gooseNum += gooseService.getRecordCount(gooseCondition);
				}
				FarmStock stock = new FarmStock();
				stock.setFarm(f);
				stock.setStock(gooseNum);
				totalStock += gooseNum;
				stockList.add(stock);
			}
					
			//查找物资购买信息		
			List<TradeGoodView> tradeGoodViewList = new ArrayList<TradeGoodView>();
			StringBuffer hql = new StringBuffer("select t from com.scau.view.goose.TradeGoodView t where 1=1 ");
			int goodTypeId = -1;
			if(null != request.getParameter("goodTypeId")){
				goodTypeId = Integer.parseInt(request.getParameter("goodTypeId"));
			}
			if(0 < goodTypeId)
			{
				//输入物资种类id >0 
				hql.append(" and t.goodTypeId =" + goodTypeId) ;
			}
			
			if(null != selectedFarmer){
				hql.append(" and t.farmerId = '" + selectedFarmer.getId() + "'");
			}
			
			hql.append(" and t.tradeDate >='"+ tradeGoodViewService.getDateBefore(daysWithin) + "' order by t.tradeDate desc");
			tradeGoodViewList = tradeGoodViewService.findByCondition(hql.toString());
			
			for (TradeGoodView tradeGoodView : tradeGoodViewList) {
				totalGood += tradeGoodView.getAmount();
			}
			
			request.setAttribute("tradeGoodViewList", tradeGoodViewList);
			request.setAttribute("selectGoodTypeId", goodTypeId);
			request.setAttribute("stockList", stockList);
		}
		List<GoodType> goodTypeList = goodTypeService.list(new GoodType());
		List<Farmer> farmerList = farmerService.list(new Farmer());
		
		request.setAttribute("totalStock", totalStock);
		request.setAttribute("totalGood", totalGood);
		request.setAttribute("goodTypeList", goodTypeList);
		request.setAttribute("farmerList", farmerList);
		request.setAttribute("selectedFarmer", selectedFarmer);
		request.getSession().setAttribute("daysWithin", daysWithin);
		
		
		return "stockAndGood";		
	}
	
	public String dead() {
			// 查看鹅只非正常死亡信息
		   	int daysWithin = 100;
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			
			// 取得要显示 的日期条件
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
				DeadInfo dead = new DeadInfo();
				dead.setFarm(f);
				if(receiveGooseList.size() > 0){
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
					
				}
				else{
					dead.setDeadNum(0);
				}
				resourceList.add(dead);// 加入到结果
			}
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("today", new Date(new java.util.Date().getTime()));
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "dead";
	}
		
	public String deadDetail(){
		//查看一个指定农场的所以存栏 的receiveGoose 的死亡信息和存活率
		int daysWithin = 0;
		farm = farmService.get(farm);
		String URL = request.getRequestURI();
		this.pager.setURL(URL);
		// 取得要显示的日期条件
		if(null != request.getParameter("daysWithin")){
			daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
			request.getSession().removeAttribute("daysWithin");
		}
		else if(null != request.getSession().getAttribute("daysWithin")){
			daysWithin = (Integer)request.getSession().getAttribute("daysWithin");
		}	
		List<DeadDetail> resourceList = new ArrayList<DeadDetail>();
		if(null != farm){
			 // 查看某个农场最近接收的鹅苗交付信息
			ReceiveGoose receiveGoose = new ReceiveGoose();
			receiveGoose.setFarmId(farm.getId());
		
			String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + receiveGoose.getFarmId()
				+" and rg.receiveDate >='" + receiveGooseService.getDateBefore(daysWithin) + "' order by rg.receiveDate desc";
			
			List<ReceiveGoose> receiveGooseList = receiveGooseService.findByCondition(hql);
			int totalRows = receiveGooseList.size();// 总的记录条数
			this.pager.setTotalRowsAmount(totalRows);
			int toIndex = receiveGooseList.size() <= pager.getPageStartRow() + pager.getPageSize() ? receiveGooseList.size() : pager.getPageStartRow() + pager.getPageSize();
			for (ReceiveGoose receiveGoose2 : receiveGooseList.subList(this.pager.getPageStartRow(), toIndex)) {
				// 迭代要显示在页面的所有批次
				Goose goose = new Goose();
				goose.setReceiveId(receiveGoose2.getId());//查找出所属该批次的已死亡鹅只,未出售
				goose.setIsValid(0);
				goose.setTradeId(null);
				List<Goose> deadGooseList = gooseService.list(goose);
					
				DeadDetail deadDetail = new DeadDetail();
				deadDetail.setDeadGooses(deadGooseList);
				deadDetail.setReceiveGoose(receiveGoose2);
				deadDetail.setCurrentNum(receiveGoose2.getAmount() - deadGooseList.size());
				deadDetail.setDeadNum(deadGooseList.size());
				deadDetail.setSurviveRate((float) (1.00000 - deadGooseList.size()*1.00000/receiveGoose2.getAmount()));
				resourceList.add(deadDetail);	
			}
		}
		
		pager.setData(resourceList);
		request.setAttribute("farm", farm);
		request.setAttribute("pager", pager);
		request.getSession().setAttribute("daysWithin", daysWithin);
		return "deadDetail";
	}
	
	public String sale(){
		/*这里完成销售统计页面的一些数据初始化工作，数据计算交由类com.servlet.goose.SaleStatisticServlet完成，以异步加载形式
		 * */

		String fromDateStr = Calendar.getInstance().get(Calendar.YEAR) + "-01-01";
		Date fromDate = Date.valueOf(fromDateStr) ;//默认 1970-01-01
		Date toDate = new Date(new java.util.Date().getTime());//默认今天
		//获得销售统计的开始和终止时间
		SaleRegionService saleRegionService = (SaleRegionService)BeansUtil.get("saleRegionService");
		List<SaleRegion> saleRegionList = saleRegionService.list(new SaleRegion());
		request.setAttribute("fromDate", fromDate);
		request.setAttribute("toDate", toDate);
		request.setAttribute("saleRegionList", saleRegionList);	
		return "sale";
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

	public ReceiveGooseService getReceiveGooseService() {
		return receiveGooseService;
	}

	@Resource
	public void setReceiveGooseService(ReceiveGooseService receiveGooseService) {
		this.receiveGooseService = receiveGooseService;
	}

	public FarmService getFarmService() {
		return farmService;
	}

	@Resource
	public void setFarmService(FarmService farmService) {
		this.farmService = farmService;
	}

	public Farm getFarm() {
		return farm;
	}

	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	public Farmer getSelectedFarmer() {
		return selectedFarmer;
	}

	public void setSelectedFarmer(Farmer selectedFarmer) {
		this.selectedFarmer = selectedFarmer;
	}

	public FarmerService getFarmerService() {
		return farmerService;
	}

	@Resource
	public void setFarmerService(FarmerService farmerService) {
		this.farmerService = farmerService;
	}

	public TradeGoodViewService getTradeGoodViewService() {
		return tradeGoodViewService;
	}

	@Resource
	public void setTradeGoodViewService(TradeGoodViewService tradeGoodViewService) {
		this.tradeGoodViewService = tradeGoodViewService;
	}
}
