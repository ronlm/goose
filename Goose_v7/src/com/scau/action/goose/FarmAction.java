package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class FarmAction extends BaseAction implements ModelDriven<Farmer>{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(FarmAction.class);
	private PageController pager;
	private FarmService farmService;
	private Farm farm ;
	private Farmer farmer;
	private FarmerService farmerService;	
	
	public String list() throws Exception {
		// 取列表
			if(null != request.getAttribute("farmer")){
				farmer = (Farmer) request.getAttribute("farmer");
			}
			farmer = farmerService.get(farmer);
			farm = new Farm();
			farm.setFarmerId(farmer.getId());
			int totalRows = farmService.list(farm).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<Farm> resourceList = farmService.list(new Farm(),
					this.pager.getPageStartRow(), pager.getPageSize(), new String[]{"farmerId"}, new Long[]{farm.getFarmerId()});
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("farmer", farmer);
			return "list";		
	}

	public String listAll() throws Exception{
			farm = new Farm();
			int totalRows = farmService.list(farm).size();
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<Farm> resourceList = farmService.list(new Farm(),
					this.pager.getPageStartRow(), pager.getPageSize(), null,null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.setAttribute("farmer", null);
			return "list";		
	}
	
	public String get() {
		// 点了添加或者点了修改	
			farm = farmService.get(farm);
			request.setAttribute("farm", farm);
			return "edit";
	}

	public String add(){
		farmer = farmerService.get(farmer);
		request.setAttribute("farmer", farmer);
		return "edit";
	}
	
	public String save() throws Exception {
		// 保存表单
		try {
			
			farmService.save(farm);
			farmer = new Farmer();
			farmer.setId(farm.getFarmerId());
			farmer = farmerService.get(farmer);
			request.setAttribute("farmer", farmer);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("farm", farm);
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

	
	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
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
	public Farmer getModel() {
		// TODO Auto-generated method stub
		return farmer;
	}

	
}
