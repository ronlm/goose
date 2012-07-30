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
import com.scau.model.goose.Retailer;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.RetailerService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class RetailerAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(RetailerAction.class);
	private PageController pager;
	private RetailerService retailerService;
	private Retailer retailer;
		
	public String list() {
		// 取列表	
			
			int totalRows = retailerService.getRecordCount(new Retailer());
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<Retailer> resourceList = retailerService.list(new Retailer(),
					this.pager.getPageStartRow(), pager.getPageSize(), null, null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			retailer = retailerService.get(retailer);
			request.setAttribute("retailer", retailer);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			retailerService.save(retailer);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("retailer", retailer);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}
	}

	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				Farmer farmer= new Farmer();
				if (null != id && !("".equals(id))) {
					farmer.setId(Long.valueOf(id));
					retailerService.delete(retailer);
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
	public void setRetailerService(RetailerService retailerService) {
		this.retailerService = retailerService;
	}

	public Retailer getRetailer() {
		return retailer;
	}

	public void setRetailer(Retailer retailer) {
		this.retailer = retailer;
	}

	

	
}
