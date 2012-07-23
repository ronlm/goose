package cn.com.ege.mvc.security;

import java.io.IOException;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import cn.com.ege.mvc.exception.BusinessException;

import com.scau.model.comm.CommResource;
import com.scau.model.comm.CommRoleResource;
import com.scau.model.comm.CommUser;
import com.scau.service.impl.comm.CommResourceService;
import com.scau.service.impl.comm.CommRoleResourceService;
import com.scau.util.BeansUtil;


public class SecurityFilter implements Filter {

	private final static Logger logger = Logger.getLogger(SecurityFilter.class);

	private String[] interceptPaths = {"/pages"};//要拦截的路径
	
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		
		String path = request.getServletPath();
		
		System.out.println(path);
		if(path.startsWith(interceptPaths[0])){
			//获取当前登录用户的信息
			CommUser user = (CommUser)request.getSession().getAttribute("loginUser");
			if(hasRight(path, user)){
				//继续往下执行
				arg2.doFilter(request, response);
			}else {
				String message = "尝试访问未授权资源! 已被拦截.";
				logger.error(message);
				response.setStatus(response.SC_FORBIDDEN);
				message = java.net.URLEncoder.encode(message, "UTF-8")+ "<br/>path=" + path  + (null == user ? " " : " <br/>userId=" + user.getId() + " <br/>用户名：" + user.getUserName());
				String url = request.getContextPath()+"/error/403.jsp?message=" + message;
				logger.info("url=" + url);
				response.sendRedirect(url);
			}
		}
		else {
			//继续往下执行
			arg2.doFilter(request, response);
		}
	}

	private boolean hasRight(String path, CommUser user) {
		if(null != user && null != user.getRoleId()){
			//取得当前用户的可访问资源
			CommRoleResource crr = new CommRoleResource();
			crr.setRoleId(user.getRoleId());
			CommRoleResourceService commRoleResourceService = (CommRoleResourceService) BeansUtil.get("commRoleResourceService");//new CommRoleResourceService();
			CommResourceService commResourceService = (CommResourceService) BeansUtil.get("commResourceService");
			List<CommRoleResource> commRoleResources;
			try {
				commRoleResources = commRoleResourceService.listByRoleId(crr);
				for (CommRoleResource commRoleResource : commRoleResources) {
					CommResource commResource = new CommResource();
					commResource.setId(commRoleResource.getResourceId());
					CommResource resource = commResourceService.get(commResource);
					logger.info("角色可访问资源: " + resource.getPath() + " 当前: " + path);
					System.out.println("path= " + path);
					System.out.println("resource.getPath()= " + resource.getPath());
					if(match(path, resource.getPath())){
						logger.info("该资源可访问. 验证通过! resourcePath=" + resource.getPath());
						return true;
					}
				}
			} catch (Exception e) {
				logger.error("查询权限时出错了: " + e.getMessage(), e);
			}
			
		}
		return false;
	}
	
	

	/** 使用正则表达式来匹配路径
	 * @param path
	 * @param resource
	 * @return
	 */
	protected static boolean match(String path, String resource) {
		Pattern pattern = Pattern.compile(resource);
		Matcher matcher = pattern.matcher(path);
		return matcher.find();
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
	
}
