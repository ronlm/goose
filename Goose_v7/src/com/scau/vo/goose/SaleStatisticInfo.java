package com.scau.vo.goose;

public class SaleStatisticInfo {
	private String name;//销售分区名或销售商名
	private Integer totalAmount;// 销售的鹅只总数
	private Double totalWeight;//销售的鹅只总重量
	private Double totalValue;//销售的鹅只总价值
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Double getTotalWeight() {
		return totalWeight;
	}
	public void setTotalWeight(Double totalWeight) {
		this.totalWeight = totalWeight;
	}
	public Double getTotalValue() {
		return totalValue;
	}
	public void setTotalValue(Double totalValue) {
		this.totalValue = totalValue;
	}
	
	
}
