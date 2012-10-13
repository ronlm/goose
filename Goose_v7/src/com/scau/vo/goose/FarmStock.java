package com.scau.vo.goose;

import java.util.Comparator;

import com.scau.model.goose.Farm;

/** 用于存贮对象，在页面与action间传递
 * @author jianhao
 *
 */
public class FarmStock implements Comparator<FarmStock>{
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
		if (o1.getFarm().getId()> o2.getFarm().getId()) {
			return 1;
		}else if(o1.getFarm().getId()< o2.getFarm().getId()){
			return -1;
		}
		else return 0;
	}
	
}
