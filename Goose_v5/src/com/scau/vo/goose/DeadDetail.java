package com.scau.vo.goose;

import java.util.List;

import com.scau.model.goose.Goose;
import com.scau.model.goose.ReceiveGoose;

public class DeadDetail {
	private ReceiveGoose receiveGoose;
	private List<Goose> deadGooses;
	private int currentNum;
	private int deadNum;
	private float surviveRate;
	
	public ReceiveGoose getReceiveGoose() {
		return receiveGoose;
	}
	public void setReceiveGoose(ReceiveGoose receiveGoose) {
		this.receiveGoose = receiveGoose;
	}
	public List<Goose> getDeadGooses() {
		return deadGooses;
	}
	public void setDeadGooses(List<Goose> deadGooses) {
		this.deadGooses = deadGooses;
	}
	public int getCurrentNum() {
		return currentNum;
	}
	public void setCurrentNum(int currentNum) {
		this.currentNum = currentNum;
	}
	public int getDeadNum() {
		return deadNum;
	}
	public void setDeadNum(int deadNum) {
		this.deadNum = deadNum;
	}
	public float getSurviveRate() {
		return surviveRate;
	}
	public void setSurviveRate(float surviveRate) {
		this.surviveRate = surviveRate;
	}

	
	
	
}
