package com.scau.action.comm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

/** 本类提供最高层Action类的抽象，封装了对HttpServletequest 和 HttpServletResponse的访问
 * @author jianhao
 *
 */
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
	
	/** 取得这个action 执行list方法URL
	 * @param URL
	 * @return
	 */
	public String getListURL(){
		StringBuffer URL = new StringBuffer(request.getRequestURI().substring(0, request.getRequestURI().indexOf("!")));
		return URL.append("!list").toString();
	}
}
