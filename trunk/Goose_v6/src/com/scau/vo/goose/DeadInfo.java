package com.scau.vo.goose;

import java.util.List;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Goose;

/** 存储农场的鹅只非正常死亡的信息：农场的信息，每只死亡的鹅的id号
 * @author jianhao
 *
 */
public class DeadInfo {
	private Farm farm;
	private int deadNum;
	private List<Goose> deadGooses;
	
	public Farm getFarm() {
		return farm;
	}
	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	public List<Goose> getDeadGooses() {
		return deadGooses;
	}
	public void setDeadGooses(List<Goose> deadGooses) {
		this.deadGooses = deadGooses;
	}
	public int getDeadNum() {
		return deadNum;
	}
	public void setDeadNum(int deadNum) {
		this.deadNum = deadNum;
	}
	
}
