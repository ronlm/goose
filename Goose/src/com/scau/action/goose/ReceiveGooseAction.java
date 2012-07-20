package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.PageController;

@Component
public class ReceiveGooseAction extends BaseAction implements ModelDriven<Farm>{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(ReceiveGooseAction.class);
	private PageController pageController;
	private FarmService farmService;
	private Farm farm ;
	private ReceiveGoose receiveGoose;
	private ReceiveGooseService receiveGooseService;
	public String list() throws Exception {
		// 取列表
			farm = farmService.get(farm);
			receiveGoose = new ReceiveGoose();
			receiveGoose.setFarmId(farm.getId());
			int totalRows = receiveGooseService.list(receiveGoose).size();
			String URL = request.getRequestURI();
			this.pageController.setURL(URL);
			this.pageController.setTotalRowsAmount(totalRows);
			List<ReceiveGoose> resourceList = receiveGooseService.list(new ReceiveGoose(),
					this.pageController.getPageStartRow(), pageController.getPageSize(), new String[]{"farmId"}, new Long[]{farm.getId()});
			pageController.setData(resourceList);
			request.setAttribute("pageController", pageController);
		
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			
			return "edit";
	}

	public String save() throws Exception {
		// 保存表单
		try {
			
			
		
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			
			return list();
		}
	}

	public String del() throws Exception {
		// 删除	
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				Farm farm= new Farm();
				if (null != id && !("".equals(id))) {
					farm.setId(Long.valueOf(id));
					farmService.delete(farm);
				}
			}
			return list();//返回取列表页面，并刷新列表
	}

	

	public PageController getPageController() {
		return pageController;
	}

	@Resource
	public void setPageController(PageController pageController) {
		this.pageController = pageController;
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

	@Override
	public Farm getModel() {
		// TODO Auto-generated method stub
		return farm;
	}

	
}
