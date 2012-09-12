package com.scau.model.goose;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

import com.scau.service.impl.goose.SaleRegionService;
import com.scau.util.BeansUtil;


@Entity
@Component
public class Retailer implements Serializable{
	private Long id;
	private String name;
	private Long regionId;
	private String region;
	private String phone;
	private String address;
	private String comments;
	
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Long getRegionId() {
		return regionId;
	}
	public void setRegionId(Long regionId) {
		this.regionId = regionId;
	}
	
	public void setRegion(){
		SaleRegionService saleRegionService = (SaleRegionService) BeansUtil.get("saleRegionService");
		SaleRegion saleRegion = new SaleRegion();
		saleRegion.setId(this.getRegionId());
		saleRegion = saleRegionService.get(saleRegion);
		this.setRegion(saleRegion.getRegion());
		
	}
}