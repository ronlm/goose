package com.scau.model.goose;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

/** 鹅只死亡原因 model
 * @author jianhao
 *
 */
@Entity(name="dead_reason")
@Component
public class DeadReason {
	private Long id;
	private String reason;
	
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
}
