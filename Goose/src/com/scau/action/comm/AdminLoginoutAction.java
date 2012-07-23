package com.scau.action.comm;

import java.io.Serializable;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ModelDriven;
import com.scau.action.BaseAction;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommRoleResource;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommRoleResourceService;
import com.scau.service.impl.comm.CommRoleService;
import com.scau.service.impl.comm.CommUserService;

import cn.com.ege.mvc.exception.BusinessException;

@Component
@Scope("prototype")
public class AdminLoginoutAction extends BaseAction implements Serializable ,ModelDriven<CommUser>{

	private final static Log logger = LogFactory.getLog(AdminLoginoutAction.class);
	private CommUser commUser;
	private CommUser loginUser;
	private CommUserService commUserService;
	private CommRoleResourceService commRoleResourceService;
	private CommUser user ;
	private MenuAction menuAction;
	private CommRoleService commRoleService;
	
	public String login() throws Exception {
		try {
			loginUser = (CommUser) commUserService.checkUser(user);
			if (null != loginUser) {
				CommRoleResource crr = new CommRoleResource();
				crr.setRoleId(loginUser.getRoleId());
				List<CommRoleResource> crrList = commRoleResourceService.list(crr);
				String menu = menuAction.printMainMenu(request, crrList);
				menu = this.trim(menu);
				
				CommRole role = new CommRole();
				role.setId(loginUser.getRoleId());
				role = commRoleService.get(role);

				request.getSession().setAttribute("loginUser", loginUser);
				request.getSession().setAttribute("role", role);
				request.getSession().setAttribute("menu", menu);
				return "success";
			} else {
				request.setAttribute("message", "用户不存在或密码错误！");
				return "failure";
			}
		} catch (BusinessException e) {
			logger.error(e);
			return "error";
		}

	}

	public String logout() {
		request.getSession().invalidate();
		return "failure";

	}

	public String get() {
		// 取得当前登录用户
		user = commUserService.get(user);
		request.setAttribute("user", user);
		return "edit";
	}

	public String save() {

		try {	
			commUserService.save(user);
			request.setAttribute("message",
					"资料修改成功，请<a href=\"" + request.getContextPath() + "/Login.jsp\">重新登录。</a>");
			return "edit";
		} catch (Exception e) {
			request.setAttribute("user", user);
			request.setAttribute("message", e.getMessage());
			return "edit";
		}

	}

	public CommUser getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(CommUser loginUser) {
		this.loginUser = loginUser;
	}

	public CommUser getCommUser() {
		return commUser;
	}

	@Resource
	public void setCommUser(CommUser commUser) {
		this.commUser = commUser;
	}

	public CommUserService getCommUserService() {
		return commUserService;
	}

	@Resource
	public void setCommUserService(CommUserService commUserService) {
		this.commUserService = commUserService;
	}

	public CommRoleResourceService getCommRoleResourceService() {
		return commRoleResourceService;
	}

	@Resource
	public void setCommRoleResourceService(
			CommRoleResourceService commRoleResourceService) {
		this.commRoleResourceService = commRoleResourceService;
	}
	
	public MenuAction getMenuAction() {
		return menuAction;
	}

	@Resource
	public void setMenuAction(MenuAction menuAction) {
		this.menuAction = menuAction;
	}

	
	public CommRoleService getCommRoleService() {
		return commRoleService;
	}

	@Resource
	public void setCommRoleService(CommRoleService commRoleService) {
		this.commRoleService = commRoleService;
	}

	
	
	public CommUser getUser() {
		return user;
	}

	public void setUser(CommUser user) {
		this.user = user;
	}

	// 把空的<li></li>对和<li><ul></ul></li>对删除掉。
	private String trim(String str) {
		Pattern p = Pattern.compile("<li></li>");
		Matcher m = p.matcher(str);
		if (m.find()) {
			str = m.replaceAll("");
		}
		p = Pattern.compile("<li><ul></ul></li>");
		m = p.matcher(str);
		if (m.find()) {
			str = m.replaceAll("");
		}
		return str;
	}

	public CommUser getModel() {
		// TODO Auto-generated method stub
		return user;
	}
}
