package com.scau.service.impl.comm;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommRoleResource;
import com.scau.service.BaseService;

@Component
public class CommRoleResourceService extends BaseService<CommRoleResource> implements Serializable {

	public List<CommRoleResource> listByRoleId(CommRoleResource entity) throws BusinessException {
		if(null != entity && null != entity.getRoleId()){
			
			@SuppressWarnings("unchecked")
			List<CommRoleResource> roleResources = baseDao.getHibernateTemplate().find(
					"from CommRoleResource rr where rr.roleId=?" ,entity.getRoleId());
			return roleResources;
		}
		else {
			throw new BusinessException("roleId 不能为空!");
		}
	}

}
