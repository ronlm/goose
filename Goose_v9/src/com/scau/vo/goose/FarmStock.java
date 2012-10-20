package com.scau.vo.goose;

import java.util.Comparator;

import com.scau.model.goose.Farm;
import com.scau.model.goose.Farmer;

/** 用于存贮对象，在页面与action间传递
 * @author jianhao
 *
 */
public class FarmStock implements Comparator<FarmStock>{
	private Farmer farmer;
	private Farm farm;
	private Long stock;
	public Farm getFarm() {
		return farm;
	}
	public void setFarm(Farm farm) {
		this.farm = farm;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	@Override
	public int compare(FarmStock o1, FarmStock o2) {
		int falg = o1.getFarm().getId().compareTo(o2.getFarm().getId());
		return falg;
	}
	public Farmer getFarmer() {
		return farmer;
	}
	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}
	
}
