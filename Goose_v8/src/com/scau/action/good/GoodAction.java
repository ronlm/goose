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
import com.scau.service.impl.goose.GoodService;
import com.scau.service.impl.goose.GoodTypeService;
import com.scau.service.impl.goose.GoodViewService;
import com.scau.util.PageController;
import com.scau.view.goose.GoodView;

@Component
@Scope("prototype")
public class GoodAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(GoodAction.class);
	private PageController pager;
	private GoodService goodService;
	private GoodViewService goodViewService;
	private GoodTypeService goodTypeService;
	private Good good;
	
	public String list() throws Exception {
		// 取列表,用视图 GoodView显示
			
			int totalRows = goodViewService.listAll(new GoodView()).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<GoodView> resourceList = goodViewService.list(new GoodView(),this.pager.getPageStartRow(),this.pager.getPageSize(),null,null);
			for (GoodView good : resourceList) {
				good.setStock(goodViewService.currentStock(good));//更新库存
			}
			pager.setData(resourceList);
			List<GoodType> goodTypeList = goodTypeService.list(new GoodType());
			request.setAttribute("goodTypeList", goodTypeList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			good = goodService.get(good);
			List<GoodType> goodTypeList = goodTypeService.list(new GoodType());
			request.setAttribute("goodTypeList", goodTypeList);
			request.setAttribute("good", good);
			return "edit";
	}

	public String save() throws Exception {
		// 保存表单
		try {	
			goodService.save(good);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			List<GoodType> goodTypeList = goodTypeService.list(new GoodType());
			request.setAttribute("goodTypeList", goodTypeList);
			request.setAttribute("good", good);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() throws Exception {
		// 删除	
			String[] ids = request.getParameterValues("id");
			Good good= new Good();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					goodService.delete(good,Long.parseLong(id));
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

	public GoodService getGoodService() {
		return goodService;
	}

	@Resource
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}

	public GoodTypeService getGoodTypeService() {
		return goodTypeService;
	}

	@Resource
	public void setGoodTypeService(GoodTypeService goodTypeService) {
		this.goodTypeService = goodTypeService;
	}

	public GoodViewService getGoodViewService() {
		return goodViewService;
	}

	@Resource
	public void setGoodViewService(GoodViewService goodViewService) {
		this.goodViewService = goodViewService;
	}


	
}
