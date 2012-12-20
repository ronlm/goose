package com.scau.service.impl.goose;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.DeadReason;
import com.scau.service.BaseService;

@Component
public class DeadReasonService extends BaseService<DeadReason>{
	@Transactional
	public void save(DeadReason entity) throws BusinessException{
		if (null != entity && null != entity.getReason()) {
			//id不为null,更新，为null则add
			if(null != entity.getId() && 0 != entity.getId()){
				update(entity);
			}else{
				add(entity);
			}
		}else {
			throw new BusinessException("死亡原因名不能为空!");
		}
	}

	@Override
	public DeadReason get(DeadReason entity) {
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
