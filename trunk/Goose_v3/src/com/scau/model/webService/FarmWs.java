package com.scau.model.webService;

import java.sql.Date;

//用于在web service 中传输数据的model类，解决jax-ws不能传java.sql.Date的问题
public class FarmWs {
	private Long id;
	private String name;
	private Long farmerId;
	
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
	public Long getFarmerId() {
		return farmerId;
	}
	public void setFarmerId(Long farmerId) {
		this.farmerId = farmerId;
	}
	
	
}
