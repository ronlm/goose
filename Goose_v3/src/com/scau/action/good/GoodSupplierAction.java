package com.scau.action.good;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.action.BaseAction;
import com.scau.model.goose.GoodSupplier;
import com.scau.service.impl.goose.GoodSupplierService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class GoodSupplierAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(GoodSupplierAction.class);
	private PageController pager;
	private GoodSupplierService goodSupplierService;
	private GoodSupplier goodSupplier;
		
	public String list() {
		// 取列表	
			
			int totalRows = goodSupplierService.getRecordCount(new GoodSupplier());
			String URL = request.getRequestURI();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<GoodSupplier> resourceList = goodSupplierService.list(new GoodSupplier(),
					this.pager.getPageStartRow(), pager.getPageSize(), null, null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			goodSupplier = goodSupplierService.get(goodSupplier);
			request.setAttribute("goodSupplier", goodSupplier);
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			System.out.println("test-------------------test,"+goodSupplier.getName());
			goodSupplierService.save(goodSupplier);
		
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("user", goodSupplier);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() {
		// 删除	
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				GoodSupplier goodSupplier= new GoodSupplier();
				if (null != id && !("".equals(id))) {
					goodSupplier.setId(Long.valueOf(id));
					goodSupplierService.delete(goodSupplier);
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

	public GoodSupplierService getGoodSupplierService() {
		return goodSupplierService;
	}

	@Resource
	public void setGoodSupplierService(GoodSupplierService goodSupplierService) {
		this.goodSupplierService = goodSupplierService;
	}

	public GoodSupplier getGoodSupplier() {
		return goodSupplier;
	}

	
	public void setGoodSupplier(GoodSupplier goodSupplier) {
		this.goodSupplier = goodSupplier;
	}

	
}
