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
import com.scau.exception.BusinessException;
import com.scau.model.comm.CommResource;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.util.PageController;


@Component
@Scope("prototype")
public class ResourceAction extends BaseAction implements Serializable {
	private final static Log logger = LogFactory.getLog(ResourceAction.class);
	private PageController pager;
	private CommResourceService commResourceService;
	private CommResource commResource ;
	private CommResource resource;
	
	public String list() {
		// 取列表
		int totalRows = commResourceService.getRecordCount(new CommResource());
		String URL = getListURL();
		this.pager.setURL(URL);
		this.pager.setTotalRowsAmount(totalRows);
		List<CommResource> resourceList = commResourceService.list(
				new CommResource(), this.pager.getPageStartRow(),
				pager.getPageSize(), null, null);
		pager.setData(resourceList);
		request.setAttribute("pager", pager);
		return "list";
	}

	public String get() {
		// 点了添加或者点了修改
		commResource = commResourceService.get(resource);
		request.setAttribute("resource", commResource);
		return "edit";
	}

	public String add(){
		commResource = commResourceService.get(resource);
		request.setAttribute("resource", commResource);
		return "edit";
	}
	
	
	public String save() {
		// 保存表单
		try {
			commResourceService.save(resource);
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("resource", commResource);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}
	}

	public String del() {
		// 删除
		String[] ids = request.getParameterValues("id");
		CommResource resource = new CommResource();
		for (String id : ids) {
			if (null != id && !("".equals(id))) {
				commResourceService.delete(resource,Long.parseLong(id));
			}
		}
		return list();
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

	public CommResource getResource() {
		return resource;
	}

	public void setResource(CommResource resource) {
		this.resource = resource;
	}

	
}
