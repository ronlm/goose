package com.scau.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.scau.dao.UserDao;
import com.scau.model.User;

@Component
public class UserService {
	private UserDao userDao;

	
	/** check the specific user is exist or not
	 * @param u
	 * @return
	 */
	public boolean checkUserIsExist(User u){
		if(userDao.get(u) != null)
			return true;
		else {
			return false;
		}
	}
	
	public UserDao getUserDao() {
		return userDao;
	}
	
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
}
