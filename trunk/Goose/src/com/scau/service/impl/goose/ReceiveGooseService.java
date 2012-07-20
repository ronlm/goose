package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommUser;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.BaseService;

@Component
public class ReceiveGooseService extends BaseService<ReceiveGoose>{
	public void save(ReceiveGoose receive) throws BusinessException{
		if (null != receive && null != receive.getFarmId()) {
			if(null != receive.getId() && 0 != receive.getFarmId()){
				update(receive);
			}else{
				add(receive);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public ReceiveGoose get(ReceiveGoose entity) {
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
