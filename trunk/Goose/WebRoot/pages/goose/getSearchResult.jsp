<%@page import="java.sql.Date"%>
<%@page import="java.util.Date"%>
<%@page import="com.scau.model.goose.ReceiveGoose"%>
<%@page import="com.scau.service.impl.goose.ReceiveGooseService"%>
<%@page import="java.lang.annotation.Retention"%>
<%@page import="com.scau.model.goose.Retailer"%>
<%@page import="com.scau.service.impl.goose.RetailerService"%>
<%@page import="com.scau.model.goose.Farm"%>
<%@page import="com.scau.model.goose.Farmer"%>
<%@page import="com.scau.service.impl.goose.FarmService"%>
<%@page import="com.scau.service.impl.goose.FarmerService"%>
<%@page import="com.scau.util.BeansUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<%-- 
		这个jsp 页面是用于用户在养殖的模块中，点击获取农场、农户、销售商信息时作结果返回的
 --%>
<%
	

	try {
		
		String searchType = request.getParameter("searchType");
		StringBuffer result = new StringBuffer();
		Date fromDate = new Date(-1) ;//默认 1970-01-01
		Date toDate = new Date(new java.util.Date().getTime());//默认今天
		long fromNum = 0,toNum = 0;
		
		try{
			fromDate = Date.valueOf(request.getParameter("fromDate"));
			toDate = Date.valueOf(request.getParameter("toDate"));
		}catch(Exception e){
			out.print("<font color=\"red\">查询相关资料出错!</font>");
		}
		
		if(null != request.getParameter("fromNum") && null != request.getParameter("toNum")){
			fromNum = Long.parseLong(request.getParameter("fromNum"));
			toNum = Long.parseLong(request.getParameter("toNum"));
		}
		
		if(searchType.equals("receiveGoose")){
			ReceiveGooseService receiveGooseService = (ReceiveGooseService)BeansUtil.get("receiveGooseService");
			List<ReceiveGoose> resultList = receiveGooseService.findByCondition("select r from com.scau.model.goose.ReceiveGoose r where r.receiveDate "
			+ "between '"+ fromDate + "' and '"+ toDate +"' and r.amount between" + fromNum +" and "+ toNum);
			
		}else if(searchType.equals("tradeGoose")){
			
		}
		else if(searchType.equals("saleGoose")){
			
		}
		else if(searchType.equals("buyGood")){
			
		}
		else if(searchType.equals("tradeGood")){
			
		}else{
			out.print("暂无相关资料");
		}
		
	} catch (Exception e) {
		out.print("<font color=\"red\">查询相关资料出错!</font>");
	}
%>
</html>