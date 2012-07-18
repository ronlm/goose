package com.scau.service.impl.comm;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.scau.model.comm.CommRole;
import com.scau.service.BaseService;

import cn.com.ege.mvc.exception.BusinessException;

@Component
public class CommRoleService extends BaseService<CommRole> implements Serializable{
	
	public Long save(CommRole role) throws BusinessException{
		if (null != role && null != role.getName()) {
			if(null != role.getId() && 0 != role.getId()){
				update(role);	
				return role.getId();
			}else{
				add(role);
				return get(role).getId();
			}
		}else {
			throw new BusinessException("角色名不能为空!");
		}
	}
}
