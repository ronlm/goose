package com.scau.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

@Component
@Scope("prototype")
public class BaseAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	public void setServletResponse(HttpServletResponse arg0) {
		response = arg0;
	}
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;
	}
}
