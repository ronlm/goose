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
import com.scau.model.goose.BuyGood;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Good;
import com.scau.model.goose.GoodSupplier;
import com.scau.model.goose.GoodType;
import com.scau.model.goose.TradeGood;
import com.scau.service.impl.goose.BuyGoodService;
import com.scau.service.impl.goose.BuyGoodViewService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.GoodService;
import com.scau.service.impl.goose.GoodSupplierService;
import com.scau.service.impl.goose.GoodTypeService;
import com.scau.service.impl.goose.TradeGoodService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;
import com.scau.view.goose.BuyGoodView;

@Component
@Scope("prototype")
public class BuyGoodAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(BuyGoodAction.class);
	private PageController pager;
	private BuyGoodService buyGoodService;
	private BuyGood buyGood;
	private BuyGoodViewService buyGoodViewService;
	private BuyGoodView buyGoodView;
	private GoodSupplierService goodSupplierService;
	private GoodSupplier selectedGoodSupplier;
	private GoodTypeService goodTypeService;
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
			
			selectedGoodSupplier = goodSupplierService.get(selectedGoodSupplier);
			StringBuilder hql = new StringBuilder("from com.scau.view.goose.BuyGoodView t where 1=1 ");
			
			int goodTypeId = -1;
			if(null != request.getParameter("goodTypeId")){
				goodTypeId = Integer.parseInt(request.getParameter("goodTypeId"));
			}
			if(0 < goodTypeId)
			{
				//输入物资种类id >0 
				hql.append(" and t.goodTypeId =" + goodTypeId) ;
			}
			
			if(null != selectedGoodSupplier){
				hql.append(" and t.supplierId = '" + selectedGoodSupplier.getId() + "'");
			}
			
			hql.append(" and t.date >='"+ buyGoodViewService.getDateBefore(daysWithin) + "' order by t.date desc");
			
			int totalRows = buyGoodViewService.findByCondition(hql.toString()).size();// 总的记录条数
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<BuyGoodView> resourceList = buyGoodViewService.findByCondition(this.pager.getPageStartRow(), this.pager.getPageSize(), hql.toString());
			List<GoodSupplier> goodSupplierList = goodSupplierService.list(new GoodSupplier());
			List<GoodType> goodTypeList = goodTypeService.list(new GoodType());
			pager.setData(resourceList);
			request.setAttribute("selectedGoodSupplier", selectedGoodSupplier);
			request.setAttribute("goodSupplierList", goodSupplierList);
			request.setAttribute("goodTypeList", goodTypeList);
			request.setAttribute("selectGoodTypeId", goodTypeId);
			request.setAttribute("pager", pager);
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			buyGood = buyGoodService.get(buyGood);
			GoodService goodService = (GoodService) BeansUtil.get("goodService");
			GoodSupplierService goodSupplierService = (GoodSupplierService) BeansUtil.get("goodSupplierService");
			
			List<Good> goodList = goodService.list(new Good());
			List<GoodSupplier> supplierList = goodSupplierService.list(new GoodSupplier());
			request.setAttribute("goodList", goodList);
			request.setAttribute("supplierList", supplierList);
			request.setAttribute("buyGood", buyGood);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			buyGoodService.save(buyGood);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			GoodService goodService = (GoodService) BeansUtil.get("goodService");
			GoodSupplierService goodSupplierService = (GoodSupplierService) BeansUtil.get("goodSupplierService");
			
			List<Good> goodList = goodService.list(new Good());
			List<GoodSupplier> supplierList = goodSupplierService.list(new GoodSupplier());
			request.setAttribute("goodList", goodList);
			request.setAttribute("supplierList", supplierList);
			request.setAttribute("buyGood", buyGood);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}
	}

	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			BuyGood buyGood= new BuyGood();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					buyGoodService.delete(buyGood,Long.parseLong(id));
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

	public BuyGoodService getBuyGoodService() {
		return buyGoodService;
	}

	@Resource
	public void setBuyGoodService(BuyGoodService buyGoodService) {
		this.buyGoodService = buyGoodService;
	}

	public BuyGood getBuyGood() {
		return buyGood;
	}

	public void setBuyGood(BuyGood buyGood) {
		this.buyGood = buyGood;
	}

	public BuyGoodViewService getBuyGoodViewService() {
		return buyGoodViewService;
	}

	@Resource
	public void setBuyGoodViewService(BuyGoodViewService buyGoodViewService) {
		this.buyGoodViewService = buyGoodViewService;
	}

	public BuyGoodView getBuyGoodView() {
		return buyGoodView;
	}

	public void setBuyGoodView(BuyGoodView buyGoodView) {
		this.buyGoodView = buyGoodView;
	}

	public GoodSupplierService getGoodSupplierService() {
		return goodSupplierService;
	}

	@Resource
	public void setGoodSupplierService(GoodSupplierService goodSupplierService) {
		this.goodSupplierService = goodSupplierService;
	}

	public GoodSupplier getSelectedGoodSupplier() {
		return selectedGoodSupplier;
	}

	public void setSelectedGoodSupplier(GoodSupplier selectedGoodSupplier) {
		this.selectedGoodSupplier = selectedGoodSupplier;
	}

	public GoodTypeService getGoodTypeService() {
		return goodTypeService;
	}

	@Resource
	public void setGoodTypeService(GoodTypeService goodTypeService) {
		this.goodTypeService = goodTypeService;
	}


	
}
