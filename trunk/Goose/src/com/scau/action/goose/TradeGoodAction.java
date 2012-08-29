package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.action.BaseAction;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Good;
import com.scau.model.goose.TradeGood;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GoodService;
import com.scau.service.impl.goose.TradeGoodService;
import com.scau.service.impl.goose.TradeGoodViewService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;
import com.scau.view.goose.TradeGoodView;

@Component
@Scope("prototype")
public class TradeGoodAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(TradeGoodAction.class);
	private PageController pager;
	private TradeGoodService tradeGoodService;
	private TradeGood tradeGood;
	private TradeGoodViewService tradeGoodViewService;
	private TradeGoodView tradeGoodView;
	private int daysWithin ;
	
	public String list() {
		// 取列表
		// 取得要显示的日期条件
			if(null != request.getParameter("daysWithin")){
				daysWithin = Integer.parseInt(request.getParameter("daysWithin"));
				request.getSession().removeAttribute("daysWithin");
			}
			else if(null != request.getSession().getAttribute("daysWithin")){
				daysWithin = (Integer)request.getSession().getAttribute("daysWithin");
			}
			String hql = "select t from com.scau.view.goose.TradeGoodView t where t.tradeDate >='"
						+ tradeGoodViewService.getDateBefore(daysWithin) + "' order by t.tradeDate desc";
					
			int totalRows = tradeGoodViewService.findByCondition(hql).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<TradeGoodView> resourceList = tradeGoodViewService.findByCondition(this.pager.getPageStartRow(), this.pager.getPageSize(), 
					hql);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			tradeGood = tradeGoodService.get(tradeGood);
			GoodService goodService = (GoodService) BeansUtil.get("goodService");
			FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
						
			List<Good> goodList = goodService.list(new Good());
			List<Farmer> farmerList = farmerService.list(new Farmer());
			request.setAttribute("goodList", goodList);
			request.setAttribute("farmerList", farmerList);
			request.setAttribute("tradeGood", tradeGood);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			tradeGoodService.save(tradeGood);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			GoodService goodService = (GoodService) BeansUtil.get("goodService");
			FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
			
			List<Good> goodList = goodService.list(new Good());
			List<Farmer> farmerList = farmerService.list(new Farmer());
			request.setAttribute("goodList", goodList);
			request.setAttribute("farmerList", farmerList);
			request.setAttribute("tradeGood", tradeGood);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}
	}

	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				TradeGood tradeGood= new TradeGood();
				if (null != id && !("".equals(id))) {
					tradeGood.setId(Long.valueOf(id));
					tradeGoodService.delete(tradeGood);
				}
			}
			return list();//返回取列表页面，并刷新列表
	}

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public TradeGoodService getTradeGoodService() {
		return tradeGoodService;
	}

	@Resource
	public void setTradeGoodService(TradeGoodService tradeGoodService) {
		this.tradeGoodService = tradeGoodService;
	}

	public TradeGood getTradeGood() {
		return tradeGood;
	}

	public void setTradeGood(TradeGood tradeGood) {
		this.tradeGood = tradeGood;
	}

	public TradeGoodViewService getTradeGoodViewService() {
		return tradeGoodViewService;
	}

	@Resource
	public void setTradeGoodViewService(TradeGoodViewService tradeGoodViewService) {
		this.tradeGoodViewService = tradeGoodViewService;
	}

	public TradeGoodView getTradeGoodView() {
		return tradeGoodView;
	}

	public void setTradeGoodView(TradeGoodView tradeGoodView) {
		this.tradeGoodView = tradeGoodView;
	}

	

	
}
