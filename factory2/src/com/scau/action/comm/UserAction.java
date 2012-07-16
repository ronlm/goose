package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.service.impl.comm.CommUserService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;

import cn.com.ege.mvc.exception.BusinessException;

@Component
@Scope("prototype")
public class UserAction extends BaseAction implements Serializable {

	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(UserAction.class);
	private PageController pageController;
	private CommUserService commUserService;
	private CommUser commUser;
	private List<CommRole> roleList = null;
	
	public String list() {
		// 取列表
		
			int totalRows = commUserService.getRecordCount(new CommUser());
			String URL = request.getRequestURI();
			this.pageController.setURL(URL);
			this.pageController.setTotalRowsAmount(totalRows);
			List<CommUser> resourceList = commUserService.list(new CommUser(),
					this.pageController.getPageStartRow(), pageController.getPageSize(), null, true);
			pageController.setData(resourceList);
			request.setAttribute("pager", pageController);
			return "list";
		
	}

	public String get() {
		// 点了添加或者点了修改	
			commUser = commUserService.get(commUser);
			CommRoleService roleService = (CommRoleService) BeansUtil.get("commRoleService");
			roleList = roleService.listAll(new CommRole());
			return "edit";
	}

	public String save() {
		// 保存表单
		try {
			commUserService.save(commUser);
			return "list";
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("user", commUser);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}

	}

	public String del() {
		// 删除
		
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				CommUser user = new CommUser();
				if (null != id && !("".equals(id))) {
					user.setId(Long.valueOf(id));
					commUserService.delete(user);
				}
			}
			return "list";
	}

	

	public PageController getPageController() {
		return pageController;
	}

	@Resource
	public void setPageController(PageController pageController) {
		this.pageController = pageController;
	}

	public CommUserService getCommUserService() {
		return commUserService;
	}

	@Resource
	public void setCommUserService(CommUserService commUserService) {
		this.commUserService = commUserService;
	}

	public CommUser getCommUser() {
		return commUser;
	}

	@Resource
	public void setCommUser(CommUser commUser) {
		this.commUser = commUser;
	}

	public List<CommRole> getRoleList() {
		return roleList;
	}


	public void setRoleList(List<CommRole> roleList) {
		this.roleList = roleList;
	}

}
