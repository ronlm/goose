package com.scau.action.good;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Good;
import com.scau.model.goose.GoodType;
import com.scau.model.goose.TradeGood;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GoodService;
import com.scau.service.impl.goose.GoodTypeService;
import com.scau.service.impl.goose.TradeGoodService;
import com.scau.service.impl.goose.TradeGoodViewService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;
import com.scau.view.goose.TradeGoodView;
/**
 * 处理与物资销售相关请求
 * @author jianhao
 *
 */
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
	private FarmerService farmerService;
	private Farmer selectedFarmer ;
	private int daysWithin ;
	
	/**
	 * 展示特定日期和种类的所有物资销售记录
	 * @return
	 */
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
			
			selectedFarmer = farmerService.get(selectedFarmer);
			List<TradeGoodView> resourceList = new ArrayList<TradeGoodView>();
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
			int totalRows = tradeGoodViewService.findByCondition(hql.toString()).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			resourceList = tradeGoodViewService.findByCondition(this.pager.getPageStartRow(), this.pager.getPageSize(), hql.toString());
			List<Farmer> farmerList = farmerService.list(new Farmer());
			
			GoodTypeService goodTypeService = (GoodTypeService) BeansUtil.get("goodTypeService");
			List<GoodType> goodTypeList = goodTypeService.list(new GoodType());
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("selectGoodTypeId", goodTypeId);
			request.setAttribute("goodTypeList", goodTypeList);
			request.setAttribute("farmerList", farmerList);
			request.setAttribute("selectedFarmer", selectedFarmer);
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "list";		
	}

	/**
	 * 点了添加或者点了修改销售记录
	 * @return
	 */
	public String get() {

			tradeGood = tradeGoodService.get(tradeGood);
			GoodService goodService = (GoodService) BeansUtil.get("goodService");
						
			List<Good> goodList = goodService.list(new Good());
			List<Farmer> farmerList = farmerService.list(new Farmer());
			request.setAttribute("goodList", goodList);
			request.setAttribute("farmerList", farmerList);
			request.setAttribute("tradeGood", tradeGood);
			return "edit";
	}

	/**
	 * 保存编辑物资销售表单的记录
	 * @return
	 */
	public String save() {
		// 保存表单
		try {
			tradeGoodService.save(tradeGood);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			GoodService goodService = (GoodService) BeansUtil.get("goodService");		
			List<Good> goodList = goodService.list(new Good());
			List<Farmer> farmerList = farmerService.list(new Farmer());
			request.setAttribute("goodList", goodList);
			request.setAttribute("farmerList", farmerList);
			request.setAttribute("tradeGood", tradeGood);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}
	}

	/**
	 * 删除选中的销售信息
	 * @return
	 */
	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			TradeGood tradeGood= new TradeGood();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					tradeGoodService.delete(tradeGood,Long.parseLong(id));
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

	public FarmerService getFarmerService() {
		return farmerService;
	}

	@Resource
	public void setFarmerService(FarmerService farmerService) {
		this.farmerService = farmerService;
	}

	public Farmer getSelectedFarmer() {
		return selectedFarmer;
	}

	public void setSelectedFarmer(Farmer selectedFarmer) {
		this.selectedFarmer = selectedFarmer;
	}

}
