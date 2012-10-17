package com.scau.vo.goose;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;

/** 存储农场的鹅只非正常死亡的信息：农场的信息，每只死亡的鹅的id号
 * @author jianhao
 *
 */
public class DeadInfo {
	private Farm farm;
	private Farmer farmer;
	private int deadNum;
	
	public Farm getFarm() {
		return farm;
	}
	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	public int getDeadNum() {
		return deadNum;
	}
	public void setDeadNum(int deadNum) {
		this.deadNum = deadNum;
	}
	public Farmer getFarmer() {
		return farmer;
	}
	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}
	
}
