package com.scau.service.impl.goose;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


import com.scau.exception.BusinessException;
import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;
import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;
import com.scau.service.BaseService;
import com.scau.util.BeansUtil;
import com.scau.vo.goose.DeadInfo;

@Component
public class FarmService extends BaseService<Farm>{
	@Transactional
	public void save(Farm farm) throws BusinessException{
		if (null != farm && null != farm.getName()) {
			if(null != farm.getId() && 0 != farm.getId()){
				//id不为null,更新，为null则add
				update(farm);
			}else{
				add(farm);
			}
		}else {
			throw new BusinessException("养殖场名不能为空!");
		}
	}
	
	@Override
	public Farm get(Farm entity) {
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
		ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
		
		List<Farm> farmList = farmService.list(new Farm());
		List<DeadInfo> resourceList = new LinkedList<DeadInfo>();// 结果列
		for (Farm f : farmList) {
			// 查找每个农场的相关信息
			List<ReceiveGoose> receiveGooseList = receiveGooseService
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
	
	public List<DeadInfo> getFarmsDeadInfo(int fromIndex,int toIndex,int daysWithin){
		FarmService farmService = (FarmService) BeansUtil.get("farmService");
		GooseService gooseService = (GooseService) BeansUtil.get("gooseService");
		ReceiveGooseService receiveGooseService = (ReceiveGooseService) BeansUtil.get("receiveGooseService");
		
		List<Farm> farmList = farmService.findByCondition(
				fromIndex,toIndex,
				"from com.scau.model.goose.Farm f order by f.id asc");
		List<DeadInfo> resourceList = new LinkedList<DeadInfo>();// 结果列
		for (Farm f : farmList) {
			// 查找每个农场的相关信息
			List<ReceiveGoose> receiveGooseList = receiveGooseService
					.findByCondition("from com.scau.model.goose.ReceiveGoose rg where"
							+ " rg.farmId='"
							+ f.getId()
							+ "' and rg.receiveDate >='"
							+ receiveGooseService.getDateBefore(daysWithin)
							+ "'");	
			DeadInfo dead = new DeadInfo();
			dead.setFarm(f);
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
