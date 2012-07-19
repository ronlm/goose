package com.scau.model.goose;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.springframework.stereotype.Component;


@Entity(name="goose")
@Component
public class Goose implements Serializable{
	
	private int id;
	private  Goosereceive receive;
	private Goosetrade trade;
	
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@OneToOne
	public Goosereceive getReceive() {
		return receive;
	}
	public void setReceive(Goosereceive receive) {
		this.receive = receive;
	}
	@OneToOne
	public Goosetrade getTrade() {
		return trade;
	}
	public void setTrade(Goosetrade trade) {
		this.trade = trade;
	}
	
	
}
