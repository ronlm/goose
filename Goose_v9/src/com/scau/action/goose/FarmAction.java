package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.util.PageController;
/**
 * 处理与农场信息相关请求
 * @author jianhao
 *
 */
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
	
	/**
	 * 列表某个农户名下所有的农场信息
	 * @return
	 * @throws Exception
	 */
	public String list() throws Exception {
		// 取列表
			if(null != request.getAttribute("farmer")){
				//有选中特定农户
				farmer = (Farmer) request.getAttribute("farmer");
			}
			else{
				// 没有选中特定农户，则列出所有的农场信息
				listAll();
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

	/**
	 * 列出所有的农场信息
	 * @return
	 * @throws Exception
	 */
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
	
	/**
	 * 点了添加或修改农场信息
	 * @return
	 */
	public String get() {
			farm = farmService.get(farm);
			request.setAttribute("farm", farm);
			return "edit";
	}

	/**
	 * 点了添加农场
	 * @return
	 */
	public String add(){
		farmer = farmerService.get(farmer);
		request.setAttribute("farmer", farmer);
		return "edit";
	}
	
	/**
	 * 保存编辑农场信息的表单
	 * @return
	 * @throws Exception
	 */
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

	/**
	 * 删除选中的农场
	 * @return
	 * @throws Exception
	 */
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
