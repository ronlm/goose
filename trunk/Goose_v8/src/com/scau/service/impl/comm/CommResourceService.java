package com.scau.service.impl.comm;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRoleResource;
import com.scau.service.BaseService;

@Component
public class CommResourceService extends BaseService<CommResource> implements Serializable {
	
	@Transactional
	public void save(CommResource resource) throws BusinessException{
		if (null != resource && null != resource.getName()) {
			//id不为null,更新，为null则add
			if(null != resource.getId() && 0 != resource.getId()){
				update(resource);
			}else{
				add(resource);
			}
		}else {
			throw new BusinessException("资源名不能为空!");
		}
	}
	
	@Override
	public CommResource get(CommResource entity) {
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
