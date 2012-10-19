package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.exception.BusinessException;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.service.impl.comm.CommUserService;
import com.scau.util.BeansUtil;
import com.scau.util.PageController;

/**
 * 处理与系统用户相关的请求
 * @author jianhao
 *
 */
@Component
@Scope("prototype")
public class UserAction extends BaseAction implements Serializable {

	private static final long serialVersionUID = 8299975587235537983L;
	private final static Log logger = LogFactory.getLog(UserAction.class);
	private PageController pager;
	private CommUserService commUserService;
	private CommUser commUser;
	private List<CommRole> roleList = null;
	private CommUser user;
	private CommRoleService commRoleService;
	
	/**
	 * 获得系统用户列表
	 * @return
	 */
	public String list() {
			int totalRows = commUserService.getRecordCount(new CommUser());
			String URL = getListURL();
			this.pager.setURL(URL);
			this.pager.setTotalRowsAmount(totalRows);
			List<CommUser> resourceList = commUserService.list(new CommUser(),
					this.pager.getPageStartRow(), pager.getPageSize(), null, null);
			pager.setData(resourceList);
			request.setAttribute("pager", pager);
			return "list";		
	}
	/**
	 * 点了添加或者点了修改用户
	 * @return
	 */
	public String get() { 
			commUser = commUserService.get(user);
			roleList = commRoleService.listAll(new CommRole());
			request.setAttribute("user", commUser);
			return "edit";
	}

	/***
	 * 保存编辑用户表单信息
	 * @return
	 */
	public String save() {
		try {
			commUserService.save(user);
			roleList = commRoleService.listAll(new CommRole());
			return list();
		} catch (BusinessException e) {
			// 保存原来表单已输入的内容
			request.setAttribute("user", commUser);
			request.setAttribute("message", e.getMessage());
			return list();
		}
	}

	/**
	 *  删除	
	 * @return
	 */
	public String del() {
			String[] ids = request.getParameterValues("id");
			CommUser user = new CommUser();
			for (String id : ids) {
				if (null != id && !("".equals(id))) {
					commUserService.delete(user,Long.parseLong(id));
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

	public CommUser getUser() {
		return user;
	}

	public void setUser(CommUser user) {
		this.user = user;
	}

	public CommRoleService getCommRoleService() {
		return commRoleService;
	}

	@Resource
	public void setCommRoleService(CommRoleService commRoleService) {
		this.commRoleService = commRoleService;
	}

	
}
