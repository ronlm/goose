package com.scau.view.goose;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="dead_goose_view")
public class DeadGooseView {
	private Long id;
	private Long gooseId;
	private String ringId;
	private Long receiveId;
	private Long reasonId;
	private String reason;
	private Date deadDate;
	
	@Id
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getGooseId() {
		return gooseId;
	}
	public void setGooseId(Long gooseId) {
		this.gooseId = gooseId;
	}
	public String getRingId() {
		return ringId;
	}
	public void setRingId(String ringId) {
		this.ringId = ringId;
	}
	public Long getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(Long receiveId) {
		this.receiveId = receiveId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Date getDeadDate() {
		return deadDate;
	}
	public void setDeadDate(Date deadDate) {
		this.deadDate = deadDate;
	}
	public Long getReasonId() {
		return reasonId;
	}
	public void setReasonId(Long reasonId) {
		this.reasonId = reasonId;
	}
	
}
