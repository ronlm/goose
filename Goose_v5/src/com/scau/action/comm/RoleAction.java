package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.action.BaseAction;
import com.scau.exception.BusinessException;
import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommRoleResource;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.service.impl.comm.CommRoleResourceService;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;


@Component
@Scope("prototype")
public class RoleAction extends BaseAction implements Serializable {
	private final static Log logger = LogFactory.getLog(RoleAction.class);
	private PageController pager;
	private CommRoleService commRoleService;
	private List<CommRoleResource> roleResourceList = null;
	private List<CommResource> resourceList = null;
	private CommRoleResourceService commRoleResourceService;
	private CommRole commRole;
	
	public String list() {
	
			// 取列表
			int totalRows = commRoleService.getRecordCount(new CommRole());
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<CommRole> resourceList = commRoleService.list(new CommRole(),
					this.pager.getPageStartRow(), pager.getPageSize(), null,
					null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";
	}

	public String get() {
		// 点了添加或者点了修改
		commRole = commRoleService.get(commRole);
		
		//获取该角色的资源
		if(null != commRole){
			CommRoleResourceService commRoleResourceService = (CommRoleResourceService) BeansUtil.get("commRoleResourceService");
			CommRoleResource crr = new CommRoleResource();
			crr.setRoleId(commRole.getId());
			try {
				roleResourceList = commRoleResourceService.listByRoleId(crr);
				
			} catch (Exception e) {
				logger.error("查询获取该角色的资源时出错了: " + e.getMessage(), e);
			}
		}
		//所有资源
		CommResourceService resourceService = (CommResourceService) BeansUtil.get("commResourceService");
		resourceList = resourceService.listAll(new CommResource());
		request.setAttribute("commRole", commRole);
		request.setAttribute("commRoleResourceList", roleResourceList);
		return "edit";
	}
		
	public String save() {
		try {
			Long key = commRoleService.save(commRole);
			// 如果插入或者更新记录成功, 会返回该记录的主键
			if (null != key) {
				// 获取选中了的权限资源
				String[] resources = request.getParameterValues("resource");
				CommRoleResourceService commRoleResourceService = (CommRoleResourceService) BeansUtil.get("commRoleResourceService");
				// 把选中了的插入中间表
				CommRoleResource crr = new CommRoleResource();
				crr.setRoleId(commRole.getId());
				// 首先把当前获取的这个角色记录全部删除,然后再新增
				List<CommRoleResource> crrList = commRoleResourceService.list(crr);
				for (CommRoleResource commRoleResource : crrList) {
					commRoleResourceService.delete(commRoleResource);
				}
				
				if (null != resources) {
					for (String string : resources) {
						CommRoleResource commRoleResource = new CommRoleResource();
						commRoleResource.setRoleId(commRole.getId());
						commRoleResource.setResourceId(Long.parseLong(string));
						commRoleResourceService.add(commRoleResource);
					}
				}
			} 
			return list();// 重新取列表
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("commRole", commRole);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}

	}

	public String del() {
			// 删除
			String[] ids = request.getParameterValues("id");
			CommRole role = new CommRole();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					role.setId(Long.valueOf(id));
					commRoleService.delete(role,Long.parseLong(id));
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

	

	public CommRole getCommRole() {
		return commRole;
	}

	public void setCommRole(CommRole commRole) {
		this.commRole = commRole;
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
	
}
