package com.scau.model.goose;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

import com.scau.service.impl.goose.GoodTypeService;
import com.scau.service.impl.goose.SaleRegionService;
import com.scau.util.BeansUtil;

@Entity
@Component
public class Good {
	private Long id;
	private String name;
	private Long goodTypeId;
	private String goodTypeName;
	private String unit;
	private int stock;
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Long getGoodTypeId() {
		return goodTypeId;
	}
	public void setGoodTypeId(Long goodTypeId) {
		this.goodTypeId = goodTypeId;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getGoodTypeName() {
		return goodTypeName;
	}
	public void setGoodTypeName(String goodTypeName) {
		this.goodTypeName = goodTypeName;
	}
	
	public void setGoodTypeName(){
		GoodTypeService goodTypeService = (GoodTypeService) BeansUtil.get("goodTypeService");
		GoodType gt = new GoodType();
		gt.setId(this.getGoodTypeId());
		gt = goodTypeService.get(gt);
		this.setGoodTypeName(gt.getName());
	}
}
