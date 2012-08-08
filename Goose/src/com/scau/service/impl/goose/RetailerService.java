package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommUser;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Retailer;
import com.scau.service.BaseService;

@Component
public class RetailerService extends BaseService<Retailer>{
	@Transactional
	public void save(Retailer Retailer) throws BusinessException{
		if (null != Retailer && null != Retailer.getName()) {
			if(null != Retailer.getId() && 0 != Retailer.getId()){
				update(Retailer);
			}else{
				add(Retailer);
			}
		}else {
			throw new BusinessException("用户名不能为空!");
		}
	}

	@Override
	public Retailer get(Retailer entity) {
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
