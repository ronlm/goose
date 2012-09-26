package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.action.BaseAction;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleRegion;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.RetailerViewService;
import com.scau.service.impl.goose.SaleRegionService;
import com.scau.util.PageController;
import com.scau.view.goose.RetailerView;

@Component
@Scope("prototype")
public class RetailerAction extends BaseAction {
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(RetailerAction.class);
	private PageController pager;
	private RetailerService retailerService;
	private RetailerViewService retailerViewService;
	private SaleRegionService saleRegionService;
	private Retailer retailer;
		
	public String list() {
		// 取列表		
			int totalRows = retailerViewService.getRecordCount(new RetailerView());
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<RetailerView> resourceList = retailerViewService.list(new RetailerView(),
					this.pager.getPageStartRow(), pager.getPageSize(), null, null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			retailer = retailerService.get(retailer);
			List<SaleRegion> saleRegionList  = saleRegionService.list(new SaleRegion());
			request.setAttribute("retailer", retailer);
			request.setAttribute("saleRegionList", saleRegionList);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			retailerService.save(retailer);		
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			List<SaleRegion> saleRegionList  = saleRegionService.list(new SaleRegion());
			request.setAttribute("saleRegionList", saleRegionList);
			request.setAttribute("retailer", retailer);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			Retailer retailer= new Retailer();
			for (String id : ids) {	
				if (null != id && !("".equals(id))) {
					retailerService.delete(retailer,Long.parseLong(id));
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

	public RetailerService getRetailerService() {
		return retailerService;
	}

	@Resource
	public void setRetailerService(RetailerService RetailerService) {
		this.retailerService = RetailerService;
	}

	public SaleRegionService getSaleRegionService() {
		return saleRegionService;
	}

	@Resource
	public void setSaleRegionService(SaleRegionService saleRegionService) {
		this.saleRegionService = saleRegionService;
	}

	public Retailer getRetailer() {
		return retailer;
	}

	
	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}

	public RetailerViewService getRetailerViewService() {
		return retailerViewService;
	}

	@Resource
	public void setRetailerViewService(RetailerViewService retailerViewService) {
		this.retailerViewService = retailerViewService;
	}

	
}
