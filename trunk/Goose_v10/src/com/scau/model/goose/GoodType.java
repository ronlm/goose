package com.scau.model.goose;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

/** 物资种类 model
 * @author jianhao
 *
 */
@Entity(name="good_type")
@Component
public class GoodType {
	private Long id;
	private String name;
	
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
	
}
