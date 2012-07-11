package com.scau.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

@Component
public class BaseAction extends ActionSupport implements ServletResponseAware,ServletRequestAware{
	protected HttpServletResponse response;
	protected HttpServletRequest request;
	
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
}