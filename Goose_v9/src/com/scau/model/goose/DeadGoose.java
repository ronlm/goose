package com.scau.model.goose;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
/**
 * 记录已死亡鹅只的相关信息
 * @author jianhao
 *
 */
@Entity(name="dead_goose")
public class DeadGoose {
	private Long id;
	/**
	 * 鹅只的id
	 */
	private Long gooseId;
	/**
	 * 死亡原因id
	 */
	private Long deadReasonId;
	/**
	 * 死亡日期
	 */
	private Date deadDate;
	/**
	 * 鹅只的死亡Id,当在deadGoose的gooseId里有这个鹅的id,说明这鹅已死
	 */
	
	@Id
	@GeneratedValue
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
	public Long getDeadReasonId() {
		return deadReasonId;
	}
	public void setDeadReasonId(Long deadReasonId) {
		this.deadReasonId = deadReasonId;
	}
	public Date getDeadDate() {
		return deadDate;
	}
	public void setDeadDate(Date deadDate) {
		this.deadDate = deadDate;
	}
	
}
