package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.action.BaseAction;
import com.scau.model.goose.Farmer;
import com.scau.service.impl.goose.FarmerService;
import com.scau.util.PageController;

public class FarmerAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(FarmerAction.class);
	private PageController pageController;
	private FarmerService farmerService;
	private Farmer farmer;
		
	public String list() {
		// 取列表		
			int totalRows = farmerService.getRecordCount(new Farmer());
			String URL = request.getRequestURI();
			this.pageController.setURL(URL);
			this.pageController.setTotalRowsAmount(totalRows);
			List<Farmer> resourceList = farmerService.list(new Farmer(),
					this.pageController.getPageStartRow(), pageController.getPageSize(), null, null);
			pageController.setData(resourceList);
			request.setAttribute("pager", pageController);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			farmer = farmerService.get(farmer);
			request.setAttribute("farmer", farmer);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			
			farmerService.save(farmer);
		
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("user", farmer);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				Farmer farmer= new Farmer();
				if (null != id && !("".equals(id))) {
					farmer.setId(Long.valueOf(id));
					farmerService.delete(farmer);
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

	public FarmerService getFarmerService() {
		return farmerService;
	}

	@Resource
	public void setFarmerService(FarmerService farmerService) {
		this.farmerService = farmerService;
	}

	public Farmer getFarmer() {
		return farmer;
	}

	@Resource
	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}

	
}
