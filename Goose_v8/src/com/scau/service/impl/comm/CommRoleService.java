package com.scau.service.impl.comm;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.scau.exception.BusinessException;
import com.scau.model.comm.CommRole;
import com.scau.model.comm.CommUser;
import com.scau.service.BaseService;


@Component
public class CommRoleService extends BaseService<CommRole> implements Serializable{
	
	@Transactional
	public Long save(CommRole role) throws BusinessException{
		if (null != role && null != role.getName()) {
			//id不为null,更新，为null则add
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
	
	@Override
	public CommRole get(CommRole entity) {
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
