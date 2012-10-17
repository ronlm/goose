package com.scau.vo.goose;

import com.scau.model.goose.Farmer;
import com.scau.view.goose.Market;

public class AppearOnMarket {
	private Market market;
	private Farmer farmer;
	private long gooseNum;
	private long dayTo90;
	public Market getMarket() {
		return market;
	}
	public void setMarket(Market market) {
		this.market = market;
	}
	public long getGooseNum() {
		return gooseNum;
	}
	public void setGooseNum(long gooseNum) {
		this.gooseNum = gooseNum;
	}
	public long getDayTo90() {
		return dayTo90;
	}
	public void setDayTo90(long dayTo90) {
		this.dayTo90 = dayTo90;
	}
	public Farmer getFarmer() {
		return farmer;
	}
	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}
	
	
	
}
