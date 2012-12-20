package com.scau.model.goose;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Goose {
	private Long id;
	private String ringId;//脚环号
	private Long receiveId;
	private Long tradeId;
	private Long saleId;
	private Integer isValid;// 0表示鹅只非正常死亡，1 为正在养殖状态，2为已出售
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(Long receiveId) {
		this.receiveId = receiveId;
	}
	public Long getTradeId() {
		return tradeId;
	}
	public void setTradeId(Long tradeId) {
		this.tradeId = tradeId;
	}
	/**
	 * 0表示鹅只非正常死亡，1 为正在养殖状态，2为已出售
	 */
	public Integer getIsValid() {
		return isValid;
	}
	public void setIsValid(Integer isValid) {
		this.isValid = isValid;
	}
	public String getRingId() {
		return ringId;
	}
	public void setRingId(String ringId) {
		this.ringId = ringId;
	}
	public Long getSaleId() {
		return saleId;
	}
	public void setSaleId(Long saleId) {
		this.saleId = saleId;
	}
	
}
