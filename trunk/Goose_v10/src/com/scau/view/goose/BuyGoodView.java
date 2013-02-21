package com.scau.view.goose;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class BuyGoodView {	
	private Long id;
	private Long supplierId;
	private Long goodId;
	private Long goodTypeId;
	private String batchNum;
	private Double unitPrice;
	private Double amount;
	private String origin;
	private Date date;
	private String comments;
	private String supplierName;
	private String supplierPhone;
	private String unit;
	private String goodName;
	
	@Id
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public Long getGoodId() {
		return goodId;
	}
	public void setGoodId(Long goodId) {
		this.goodId = goodId;
	}
	
	public String getBatchNum() {
		return batchNum;
	}
	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierPhone() {
		return supplierPhone;
	}
	public void setSupplierPhone(String supplierPhone) {
		this.supplierPhone = supplierPhone;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Long getGoodTypeId() {
		return goodTypeId;
	}
	public void setGoodTypeId(Long goodTypeId) {
		this.goodTypeId = goodTypeId;
	}
	
	
}
