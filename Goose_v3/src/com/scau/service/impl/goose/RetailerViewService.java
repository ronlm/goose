package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommUser;
import com.scau.model.goose.Retailer;
import com.scau.model.goose.SaleRegion;
import com.scau.service.BaseService;
import com.scau.util.BeansUtil;
import com.scau.view.goose.RetailerView;

@Component
public class RetailerViewService extends BaseService<RetailerView>{
	
	@Override
	public RetailerView get(RetailerView entity) {
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
