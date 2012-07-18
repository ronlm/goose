package com.scau.service.impl.comm;

import java.io.Serializable;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommMenu;
import com.scau.service.BaseService;

@Component
public class CommMenuService extends BaseService<CommMenu> implements Serializable {
	
	
	public void save(CommMenu menu) throws BusinessException{
		if (null != menu && null != menu.getName()) {
			if(null != menu.getId() && 0 != menu.getId()){
				update(menu);
			}else{
				add(menu);
			}
		}else {
			throw new BusinessException("菜单名不能为空!");
		}
	}
}