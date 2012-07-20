package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommRoleResource;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.service.impl.comm.CommRoleResourceService;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;

import cn.com.ege.mvc.exception.BusinessException;

@Component
public class RoleAction extends BaseAction implements Serializable ,ModelDriven<CommRole>{
	private final static Log logger = LogFactory.getLog(RoleAction.class);
	private PageController pageController;
	private CommRoleService commRoleService;
	private CommRole commRole;
	private List<CommRoleResource> roleResourceList = null;
	private List<CommResource> resourceList = null;
	private CommRoleResourceService commRoleResourceService;
	private CommRole role;
	
	public String list() {
	
			// 取列表
			int totalRows = commRoleService.getRecordCount(new CommRole());
			String URL = request.getRequestURI();
			this.pageController.setURL(URL);
			this.pageController.setTotalRowsAmount(totalRows);
			List<CommRole> resourceList = commRoleService.list(new CommRole(),
					this.pageController.getPageStartRow(), pageController.getPageSize(), null,
					null);
			pageController.setData(resourceList);
			return "list";
	}

	public String get() {
		// 点了添加或者点了修改
		role = commRoleService.get(role);
		
		//获取该角色的资源
		if(null != role){
			CommRoleResourceService commRoleResourceService = new CommRoleResourceService();
			CommRoleResource crr = new CommRoleResource();
			crr.setRoleId(role.getId());
			try {
				roleResourceList = commRoleResourceService.listByRoleId(crr);
				
			} catch (Exception e) {
				logger.error("查询获取该角色的资源时出错了: " + e.getMessage(), e);
			}
		}
		//所有资源
		CommResourceService resourceService = (CommResourceService) BeansUtil.get("commResourceService");
		resourceList = resourceService.listAll(new CommResource());
		
			return "edit";
	}

	public String save() {
		try {
			Long key = commRoleService.save(role);
			// 如果插入或者更新记录成功, 会返回该记录的主键
			if (null != key) {
				// 获取选中了的权限资源
				String[] resources = request.getParameterValues("resource");
				CommRoleResourceService commRoleResourceService = new CommRoleResourceService();
				// 把选中了的插入中间表
				CommRoleResource crr = new CommRoleResource();
				crr.setRoleId(commRole.getId());
				// 首先把当前获取的这个角色记录全部删除,然后再新增
				commRoleResourceService.delete(crr);
				if (null != resources) {
					for (String string : resources) {
						crr.setResourceId(Long.valueOf(string));
						commRoleResourceService.add(crr);
					}
				}
			}
			return list();// 重新取列表
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("role", commRole);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}

	}

	public String del() {
			// 删除
			String[] ids = request.getParameterValues("id");
			for (String id : ids) {
				CommRole role = new CommRole();
				if (null != id && !("".equals(id))) {
					role.setId(Long.valueOf(id));
					commRoleService.delete(role);
				}
			}
			return list();
	}

	
	
	public PageController getPageController() {
		return pageController;
	}

	@Resource
	public void setPageController(PageController pageController) {
		this.pageController = pageController;
	}

	public CommRole getRole() {
		return commRole;
	}

	@Resource
	public void setRole(CommRole role) {
		this.commRole = role;
	}

	public List<CommRoleResource> getRoleResourceList() {
		return roleResourceList;
	}

	@Resource
	public void setRoleResourceList(List<CommRoleResource> roleResourceList) {
		this.roleResourceList = roleResourceList;
	}

	public List<CommResource> getResourceList() {
		return resourceList;
	}

	@Resource
	public void setResourceList(List<CommResource> resourceList) {
		this.resourceList = resourceList;
	}

	public CommRoleService getCommRoleService() {
		return commRoleService;
	}

	@Resource
	public void setCommRoleService(CommRoleService commRoleService) {
		this.commRoleService = commRoleService;
	}

	public CommRoleResourceService getCommRoleResourceService() {
		return commRoleResourceService;
	}

	@Resource
	public void setCommRoleResourceService(
			CommRoleResourceService commRoleResourceService) {
		this.commRoleResourceService = commRoleResourceService;
	}

	public CommRole getCommRole() {
		return commRole;
	}

	@Resource
	public void setCommRole(CommRole commRole) {
		this.commRole = commRole;
	}

	public CommRole getModel() {
	
		return role;
	}
	
	
}
