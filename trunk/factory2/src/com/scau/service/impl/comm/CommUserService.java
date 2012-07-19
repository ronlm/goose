package com.scau.service.impl.comm;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommUser;
import com.scau.service.BaseService;

@Component
public class CommUserService extends BaseService<CommUser> implements Serializable {

	public CommUser checkUser(CommUser entity) throws BusinessException {
		if (null == entity) {
			throw new BusinessException("用户对象不能为空!");
		}
		if (null == entity.getUserName()
				|| null == entity.getPassword()) {
			throw new BusinessException("用户名或者密码不能为空!");
		}
		return this.get(entity);
	}
	
	public void save(CommUser user) throws BusinessException{
		if (null != user && null != user.getUserName()) {
			if(null != user.getId() && 0 != user.getId()){
				update(user);
			}else{
				add(user);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public CommUser get(CommUser entity) {
		if(null != entity && null != entity.getId() && 0!= entity.getId()){
			return super.get(entity, entity.getId());
		}
		else if(null != entity) {
			return super.get(entity);
		}
		else {
			return null;
		}
	}
	
}
