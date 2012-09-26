package com.scau.action.goose;

import java.sql.Date;
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
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.impl.goose.FarmService;
import com.scau.service.impl.goose.FarmerService;
import com.scau.service.impl.goose.ReceiveGooseService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class ReceiveGooseAction extends BaseAction implements ModelDriven<Farm>{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(ReceiveGooseAction.class);
	private PageController pager;
	private FarmService farmService;
	private Farm farm ;
	private ReceiveGoose receiveGoose;
	private ReceiveGooseService receiveGooseService;
	private int daysWithin;
	
	public String list() {
		   
			List<ReceiveGoose> resourceList = null;
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
			farm = farmService.get(farm);
			if(null != farm){
				 // 查看某个农场最近接收的鹅苗信息
				
				receiveGoose = new ReceiveGoose();
				receiveGoose.setFarmId(farm.getId());
			
				String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.farmId=" + receiveGoose.getFarmId()
					+" and rg.receiveDate >='" + receiveGooseService.getDateBefore(daysWithin) + "' order by rg.receiveDate desc";
				int totalRows = receiveGooseService.findByCondition(hql).size();// 总的记录条数
				this.pager.setTotalRowsAmount(totalRows);
				resourceList = receiveGooseService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(),hql);
				request.setAttribute("farm", farm);
	
			}else if(null == farm){
				 // 查看全部农场最近接收的鹅苗信息
				String hql = "select rg from com.scau.model.goose.ReceiveGoose rg where rg.receiveDate >='" + 
						receiveGooseService.getDateBefore(daysWithin) + "' order by rg.receiveDate desc";
				int totalRows = receiveGooseService.findByCondition(hql).size();// 总的记录条数
				this.pager.setTotalRowsAmount(totalRows);
				resourceList = receiveGooseService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(),hql);
			}
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "list";		
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

	
	public String get() {
		// 点了添加或者点了修改	
			receiveGoose = receiveGooseService.get(receiveGoose);
			request.setAttribute("receiveGoose", receiveGoose);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			
			receiveGooseService.save(receiveGoose);
			return list();
		} catch (Exception e) {
			// 保存原来表单已输入的内容
			request.setAttribute("receiveGoose", receiveGoose);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}
	
	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
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

	public int getDaysWithin() {
		return daysWithin;
	}

	public void setDaysWithin(int daysWithin) {
		this.daysWithin = daysWithin;
	}

	public ReceiveGoose getReceiveGoose() {
		return receiveGoose;
	}

	public void setReceiveGoose(ReceiveGoose receiveGoose) {
		this.receiveGoose = receiveGoose;
	}

	
}
