package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.model.comm.CommResource;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.util.PageController;

import cn.com.ege.mvc.exception.BusinessException;

@Component
@Scope("prototype")
public class ResourceAction extends BaseAction implements Serializable {
	private final static Log logger = LogFactory.getLog(ResourceAction.class);
	private PageController pager = null;
	private CommResourceService commResourceService;
	private CommResource commResource ;

	public String list() {
		// 取列表
		int totalRows = commResourceService.getRecordCount(new CommResource());
		String URL = request.getRequestURI();
		this.pager.setURL(URL);
		this.pager.setTotalRowsAmount(totalRows);
		List<CommResource> resourceList = commResourceService.list(
				new CommResource(), this.pager.getPageStartRow(),
				pager.getPageSize(), null, true);
		pager.setData(resourceList);
		return "LIST";
	}

	public String get() {
		// 点了添加或者点了修改
		commResource = commResourceService.get(commResource);
		return "EDIT";
	}

	public String save() {
		// 保存表单
		try {
			commResourceService.save(commResource);
			return "getList";
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("resource", commResource);
			request.setAttribute("message", e.getMessage());
			return "EDIT";
		}
	}

	public String del() {
		// 删除
		String[] ids = request.getParameterValues("id");
		for (String id : ids) {
			CommResource resource = new CommResource();
			if (null != id && !("".equals(id))) {
				resource.setId(Long.valueOf(id));
				commResourceService.delete(resource);
			}
		}
		return "getList";
	}

	public PageController getPager() {
		return pager;
	}

	@Resource
	public void setPager(PageController pager) {
		this.pager = pager;
	}

	public CommResourceService getCommResourceService() {
		return commResourceService;
	}

	@Resource
	public void setCommResourceService(CommResourceService commResourceService) {
		this.commResourceService = commResourceService;
	}

	public CommResource getCommResource() {
		return commResource;
	}

	@Resource
	public void setCommResource(CommResource commResource) {
		this.commResource = commResource;
	}

	
}
