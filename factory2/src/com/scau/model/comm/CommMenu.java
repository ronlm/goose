package com.scau.model.comm;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity(name="comm_menu")
@Component
public class CommMenu implements Serializable {
	private Long id;
	private String name;
	private String url;
	private Long pid;
	private String image;
	private Long resourceId;

	
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



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public Long getPid() {
		return pid;
	}



	public void setPid(Long pid) {
		this.pid = pid;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public Long getResourceId() {
		return resourceId;
	}



	public void setResourceId(Long resourceId) {
		this.resourceId = resourceId;
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return id + "-" + pid +"-" + name;
	}
	/*public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}*/
	/*public Menu(Long id, Long pid, String name) {
		super();
		this.id = id;
		this.name = name;
		this.pid = pid;
	}*/
}
