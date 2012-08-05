package com.scau.action.goose;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.TradeGood;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Good;
import com.scau.model.goose.TradeGood;
import com.scau.service.impl.goose.TradeGoodService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GoodService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class TradeGoodAction extends BaseAction implements ModelDriven<TradeGood>{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(TradeGoodAction.class);
	private PageController pager;
	private TradeGood tradeGood;
	private TradeGoodService tradeGoodService;
	private GoodService goodService;
	private FarmerService farmerService;
	
	public String add() throws Exception {
		// 添加记录
		List<Good> goodList=goodService.listAll(new Good());
		List<Farmer> farmerList=farmerService.listAll(new Farmer());
		request.setAttribute("goodList", goodList);
		request.setAttribute("farmerList", farmerList);
			return "edit";		
	}
	
	public String save() throws Exception {
		// 保存表单
		try {
			// 用于显示goodId对应的goodName,以及farmerId对应的farmerName
			String goodName=goodService.get(new Good(), tradeGood.getGoodId()).getName();
			String farmerName=farmerService.get(new Farmer(), tradeGood.getFarmerId()).getName();
			request.setAttribute("goodName", goodName);
			request.setAttribute("farmerName", farmerName);
			tradeGoodService.save(tradeGood);
			// 显示刚刚插入的记录
			return show();	
		} catch (Exception e) {
			// 保存原来表单已输入的内容
			return "error";
		}
	}
	
	public String list() throws Exception {
		// 取列表
			
			int totalRows = tradeGoodService.listAll(new TradeGood()).size();
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<TradeGood> resourceList = tradeGoodService.listAll(new TradeGood());
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}
	
	private String show() {
		// TODO Auto-generated method stub
		int totalRows = 1;
		String URL = request.getRequestURI();
		this.pager.setURL(URL);
		this.pager.setTotalRowsAmount(totalRows);
		List<TradeGood> resourceList = new ArrayList<TradeGood>();
		resourceList.add(tradeGood);
		pager.setData(resourceList);
		request.setAttribute("pager", pager);
		return "list";	
	}

	
	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}
	
	public TradeGood getTradeGood() {
		return tradeGood;
	}

	public void setTradeGood(TradeGood tradeGood) {
		this.tradeGood = tradeGood;
	}

	public TradeGoodService getTradeGoodService() {
		return tradeGoodService;
	}

	@Resource
	public void setTradeGoodService(TradeGoodService tradeGoodService) {
		this.tradeGoodService = tradeGoodService;
	}
	
	public GoodService getGoodService() {
		return goodService;
	}

	@Resource
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public FarmerService getFarmerService() {
		return farmerService;
	}

	@Resource
	public void setFarmerService(FarmerService farmerService) {
		this.farmerService = farmerService;
	}

	@Override
	public TradeGood getModel() {
		// TODO Auto-generated method stub
		return tradeGood;
	}

	
}
