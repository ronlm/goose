package com.scau.action.goose;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;
import com.scau.action.BaseAction;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Good;
import com.scau.service.impl.goose.GoodService;
import com.scau.util.PageController;

@Component
@Scope("prototype")
public class GoodAction extends BaseAction{
	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(GoodAction.class);
	private PageController pager;
	private GoodService goodService;
	private Good good;
	
	public String list() throws Exception {
		// 取列表
			
			int totalRows = goodService.listAll(new Good()).size();
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<Good> resourceList = goodService.listAll(new Good());
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}

	public String get() {
		// 点了添加或者点了修改	
			good = goodService.get(good);
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
			request.setAttribute("good", good);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	public String del() throws Exception {
		// 删除	
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				Good good= new Good();
				if (null != id && !("".equals(id))) {
					good.setId(Long.valueOf(id));
					goodService.delete(good);
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


	
}
