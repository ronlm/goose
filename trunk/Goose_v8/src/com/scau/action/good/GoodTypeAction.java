package com.scau.action.good;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.comm.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Good;
import com.scau.model.goose.GoodType;
import com.scau.model.goose.SaleRegion;
import com.scau.service.impl.goose.GoodService;
import com.scau.service.impl.goose.GoodTypeService;
import com.scau.service.impl.goose.SaleGooseService;
import com.scau.service.impl.goose.SaleRegionService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class GoodTypeAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(GoodTypeAction.class);
	private PageController pager;
	private GoodTypeService goodTypeService;
	private GoodType goodType;
	
	public String list() throws Exception {
		// 取列表		
			int totalRows = goodTypeService.listAll(new GoodType()).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<GoodType> resourceList = goodTypeService.list(new GoodType(),this.pager.getPageStartRow(),this.pager.getPageSize(),null,null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			goodType = goodTypeService.get(goodType);
			request.setAttribute("goodType", goodType);
			return "edit";
	}

	public String save() throws Exception {
		// 保存表单
		try {	
			goodTypeService.save(goodType);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("goodType", goodType);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() throws Exception {
		// 删除	
			String[] ids = request.getParameterValues("id");
			GoodType goodType = new GoodType();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					goodTypeService.delete(goodType,Long.parseLong(id));
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

	public GoodTypeService getGoodTypeService() {
		return goodTypeService;
	}

	@Resource
	public void setGoodTypeService(GoodTypeService goodTypeService) {
		this.goodTypeService = goodTypeService;
	}

	public GoodType getGoodType() {
		return goodType;
	}

	public void setGoodType(GoodType goodType) {
		this.goodType = goodType;
	}
	
}
