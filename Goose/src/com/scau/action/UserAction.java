package com.scau.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.scau.model.User;
import com.scau.service.UserService;

@Component
@Scope("prototype")
public class UserAction extends BaseAction{
	private String userName;
	private String password;
	private UserService userService;

	/** ´¦ÀíµÇÂ¼ÇëÇó
	 * @return
	 */
	public String login(){
		User u = new User();
		u.setUserName(userName);
		u.setPassword(password);
		
		if(userService.checkUserIsExist(u))
			return "success";
		else {
			return "fail";
		}
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}



	public UserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	
}
