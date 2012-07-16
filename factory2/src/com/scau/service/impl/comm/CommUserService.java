package com.scau.service.impl.comm;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommUser;
import com.scau.service.BaseService;

@Component
public class CommUserService extends BaseService<CommUser> implements Serializable {

	@SuppressWarnings("unchecked")
	public CommUser checkUser(CommUser entity) throws BusinessException {
		if (null == entity) {
			throw new BusinessException("用户对象不能为空!");
		}
		if (null == entity.getUserName() || null == entity.getPassword()) {
			throw new BusinessException("用户名或者密码不能为空!");
		}
		
		return get(entity);
	}
	
	public void save(CommUser user) throws BusinessException{
		if (null != user && null != user.getUserName()) {
			if( 0 != user.getId() && null != user.getId()){
				update(user);
			}else{
				add(user);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}
}
