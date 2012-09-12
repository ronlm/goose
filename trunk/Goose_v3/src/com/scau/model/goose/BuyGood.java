package com.scau.model.goose;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity(name="buy_good")
@Component
public class BuyGood {
	private Long id;
	private Long goodId;
	private Long goodSupplierId;
	private Long batchNum;
	private Double unitPrice;
	private Long amount;
	private String origin;
	private Date date;
	private String comments;
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getGoodId() {
		return goodId;
	}
	public void setGoodId(Long goodId) {
		this.goodId = goodId;
	}
	public Long getGoodSupplierId() {
		return goodSupplierId;
	}
	public void setGoodSupplierId(Long goodSupplierId) {
		this.goodSupplierId = goodSupplierId;
	}
	public Long getBatchNum() {
		return batchNum;
	}
	public void setBatchNum(Long batchNum) {
		this.batchNum = batchNum;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
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
	
	
	
	
}
