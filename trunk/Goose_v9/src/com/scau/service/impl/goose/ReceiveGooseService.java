package com.scau.service.impl.goose;

import java.beans.Beans;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.comm.CommUser;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.BaseService;
import com.scau.util.BeansUtil;
import com.scau.vo.goose.DeadInfo;

@Component
public class ReceiveGooseService extends BaseService<ReceiveGoose>{
	@Transactional
	public void save(ReceiveGoose receive) throws BusinessException{
		if (null != receive && null != receive.getFarmId()) {
			if(null != receive.getId() && 0 != receive.getFarmId()){
				//id不为null,更新，为null则add
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
