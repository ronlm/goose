package com.scau.service.impl.comm;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommResource;
import com.scau.service.BaseService;

@Component
public class CommResourceService extends BaseService<CommResource> implements Serializable {
	
	
	public void save(CommResource resource) throws BusinessException{
		if (null != resource && null != resource.getName()) {
			if(null != resource.getId() && 0 != resource.getId()){
				update(resource);
			}else{
				add(resource);
			}
		}else {
			throw new BusinessException("角色名不能为�?!");
		}
	}
}
