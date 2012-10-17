package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.Farmer;
import com.scau.service.impl.goose.FarmerService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class FarmerAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(FarmerAction.class);
	private PageController pager;
	private FarmerService farmerService;
	private Farmer farmer;
		
	public String list() {
		// 取列表	
			
			int totalRows = farmerService.getRecordCount(new Farmer());
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<Farmer> resourceList = farmerService.list(new Farmer(),
					this.pager.getPageStartRow(), pager.getPageSize(), null, null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
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
			Farmer farmer= new Farmer();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					farmerService.delete(farmer,Long.parseLong(id));
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

	
}
