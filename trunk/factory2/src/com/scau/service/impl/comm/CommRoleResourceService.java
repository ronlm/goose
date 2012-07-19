package com.scau.service.impl.comm;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommRoleResource;
import com.scau.model.comm.CommUser;
import com.scau.service.BaseService;

@Component
public class CommRoleResourceService extends BaseService<CommRoleResource> implements Serializable {

	public List<CommRoleResource> listByRoleId(CommRoleResource entity) throws Exception {
		
		if(null != entity && null != entity.getRoleId()){
			return list(entity);
		}
		else {
			throw new BusinessException("roleId 不能为空!");
		}
	}
	@Override
	public CommRoleResource get(CommRoleResource entity) {
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
