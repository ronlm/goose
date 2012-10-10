package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.goose.Farm;
import com.scau.model.goose.TradeGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.TradeGooseService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class TradeGooseAction extends BaseAction implements ModelDriven<Farm>{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(TradeGooseAction.class);
	private PageController pager;
	private FarmService farmService;
	private Farm farm ;
	private TradeGoose tradeGoose;
	private TradeGooseService tradeGooseService;
	private int daysWithin;
	
	public String list() {
		   
			List<TradeGoose> resourceList = null;
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
			if(null != farm){
				 // 查看从某个农场最近收购的成品鹅信息
				farm = farmService.get(farm);
				tradeGoose = new TradeGoose();
				tradeGoose.setFarmId(farm.getId());
			
				String hql = "select rg from com.scau.model.goose.TradeGoose rg where rg.farmId=" + tradeGoose.getFarmId()
					+" and rg.tradeDate >='" + tradeGooseService.getDateBefore(daysWithin) + "' order by rg.tradeDate desc";
				int totalRows = tradeGooseService.findByCondition(hql).size();// 总的记录条数
				this.pager.setTotalRowsAmount(totalRows);
				resourceList = tradeGooseService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(),hql);
				request.setAttribute("farm", farm);
	
			}else if(null == farm){
				 // 查看全部农场最近接收的鹅苗信息
				String hql = "select rg from com.scau.model.goose.TradeGoose rg where rg.tradeDate >='" + 
						tradeGooseService.getDateBefore(daysWithin) + "' order by rg.tradeDate desc";
				int totalRows = tradeGooseService.findByCondition(hql).size();// 总的记录条数
				this.pager.setTotalRowsAmount(totalRows);
				resourceList = tradeGooseService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(),hql);
			}
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			tradeGoose = tradeGooseService.get(tradeGoose);
			request.setAttribute("tradeGoose", tradeGoose);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			
			tradeGooseService.save(tradeGoose);
			return list();
		} catch (Exception e) {
			// 保存原来表单已输入的内容
			request.setAttribute("tradeGoose", tradeGoose);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() throws Exception {
		// 删除	
			String[] ids = request.getParameterValues("id");
			Farm farm= new Farm();
			for (String id : ids) {	
				if (null != id && !("".equals(id))) {
					farmService.delete(farm,Long.parseLong(id));
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

	public TradeGooseService getTradeGooseService() {
		return tradeGooseService;
	}

	@Resource
	public void setTradeGooseService(TradeGooseService TradeGooseService) {
		this.tradeGooseService = TradeGooseService;
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

	@Override
	public Farm getModel() {
		// TODO Auto-generated method stub
		return farm;
	}

	public TradeGoose getTradeGoose() {
		return tradeGoose;
	}

	public void setTradeGoose(TradeGoose tradeGoose) {
		this.tradeGoose = tradeGoose;
	}

	
}
