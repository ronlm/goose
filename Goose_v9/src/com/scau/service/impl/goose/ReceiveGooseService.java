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
	
	/**
	 * 获得全部农场的死亡信息统计
	 * @param daysWithin 多少天之内
	 * @return
	 */
	public List<DeadInfo> getAllFarmDeadInfo(int daysWithin){
		FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		
		List<Farm> farmList = farmService.list(new Farm());
		List<DeadInfo> resourceList = new LinkedList<DeadInfo>();// 结果列
		for (Farm f : farmList) {
			// 查找每个农场的相关信息
			List<ReceiveGoose> receiveGooseList = this
					.findByCondition("from com.scau.model.goose.ReceiveGoose rg where"
							+ " rg.farmId='"+ f.getId() + "' and rg.receiveDate >='"
							+ this.getDateBefore(daysWithin)+ "'");	
			DeadInfo dead = new DeadInfo();
			dead.setFarm(f);
			dead.setFarmer(farmerService.get(new Farmer(),f.getFarmerId()));
			if (receiveGooseList.size() > 0) {
				dead.setFarm(f);
				List<Goose> gooseList = new LinkedList<Goose>();
				for (ReceiveGoose rg : receiveGooseList) {
					// 得到一个批次的死亡鹅只死亡记录

					List<Goose> tempList = gooseService.findByCondition("from com.scau.model.goose.Goose g where " +
							"g.receiveId = " + rg.getId() + " and g.isValid=0 ");					
					gooseList.addAll(tempList);
				}
				dead.setDeadNum(gooseList.size());
			} else {
				dead.setDeadNum(0);
			}
			resourceList.add(dead);// 加入到结果
		}
		return resourceList;
	}
}
