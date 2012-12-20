package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;


import com.scau.action.comm.BaseAction;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleGoose;
import com.scau.service.impl.goose.RetailerService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.util.PageController;

/**
 * 处理与鹅只出售相关的请求
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class SaleGooseAction extends BaseAction {
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(SaleGooseAction.class);
	private PageController pager;
	private RetailerService retailerService;
	private Retailer retailer ;
	private SaleGoose saleGoose;
	private SaleGooseService saleGooseService;
	private int daysWithin;
	
	/**
	 * 列出特定日期条件和特定销售商的成品鹅出售信息
	 * @return
	 */
	public String list()  {
		   //查看列表
			List<SaleGoose> resourceList = null;
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
			
			retailer = retailerService.get(retailer);
			if(null != retailer){
				 // 查看与某个销售商的出售信息	
				saleGoose = new SaleGoose();
				saleGoose.setRetailerId(retailer.getId());
			
				String hql = "select rg from com.scau.model.goose.SaleGoose rg where rg.retailerId=" + retailer.getId()
					+" and rg.saleDate >='" + saleGooseService.getDateBefore(daysWithin) + "' order by rg.saleDate desc";
				int totalRows = saleGooseService.findByCondition(hql).size();// 总的记录条数
				this.pager.setTotalRowsAmount(totalRows);
				resourceList = saleGooseService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(),hql);
				request.setAttribute("retailer", retailer);
	
			}else if(null == retailer){
				 // 查看全部农场最近接收的鹅苗信息
				String hql = "select rg from com.scau.model.goose.SaleGoose rg where rg.saleDate >='" + 
						saleGooseService.getDateBefore(daysWithin) + "' order by rg.saleDate desc";
				int totalRows = saleGooseService.findByCondition(hql).size();// 总的记录条数
				this.pager.setTotalRowsAmount(totalRows);
				resourceList = saleGooseService.findByCondition(this.pager.getPageStartRow(), pager.getPageSize(),hql);
			}
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			request.getSession().setAttribute("daysWithin", daysWithin);
			return "list";		
	}

	/**
	 * 点了添加或者点了修改出售记录
	 * @return
	 */
	public String get() {
			saleGoose = saleGooseService.get(saleGoose);
			request.setAttribute("saleGoose", saleGoose);
			return "edit";
	}

	/**
	 * 保存编辑出售记录表单
	 * @return
	 */
	public String save() {
		try {
			//对于可能出现的修改单价和总重量，更新销售记录的总金额
			saleGoose.setTotalValue(saleGoose.getUnitPrice() * saleGoose.getTotalWeight());
			saleGooseService.save(saleGoose);
			
			return list();
		} catch (Exception e) {
			// 保存原来表单已输入的内容
			request.setAttribute("saleGoose", saleGoose);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	/**
	 *  删除出售记录
	 * @return
	 */
	public String del() throws Exception {
			String[] ids = request.getParameterValues("id");
			SaleGoose saleGoose= new SaleGoose();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					saleGooseService.delete(saleGoose,Long.parseLong(id));
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

	public SaleGoose getSaleGoose() {
		return saleGoose;
	}

	public void setSaleGoose(SaleGoose saleGoose) {
		this.saleGoose = saleGoose;
	}

	public SaleGooseService getSaleGooseService() {
		return saleGooseService;
	}

	@Resource
	public void setSaleGooseService(SaleGooseService saleGooseService) {
		this.saleGooseService = saleGooseService;
	}

	public int getDaysWithin() {
		return daysWithin;
	}

	public void setDaysWithin(int daysWithin) {
		this.daysWithin = daysWithin;
	}

	

	
}
