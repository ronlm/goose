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
	Farm farm = new Farm();
	FarmService farmService = (FarmService) BeansUtil.get("farmService");
	Farmer farmer = new Farmer();
	FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");

	try {
		Long id =  Long.parseLong(request.getParameter("Id"));
		
		if (request.getParameter("infoType").equals("farmInfo")) {
			// 获得农户农场信息
			farm.setId(id);
			farm = farmService.get(farm);
			farmer.setId(farm.getFarmerId());
			farmer = farmerService.get(farmer);
			out.print("农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:"
					+ farmer.getPhone() + "&nbsp;&nbsp;农场名："
					+ farm.getName() + "&nbsp;&nbsp;地址:"
					+ farm.getAddress());

		} else if (request.getParameter("infoType").equals("farmerInfo")) {
			//获得农户信息
			farmer.setId(id);
			farmer = farmerService.get(farmer);
			out.print("农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:"
					+ farmer.getPhone() + "&nbsp;&nbsp;住址:"
					+ farmer.getAddress());
		} else if (request.getParameter("infoType").equals("retailerInfo")){
			// 获得销售商信息
			RetailerService retailerService = (RetailerService)BeansUtil.get("retailerService");
			Retailer retailer = new Retailer();
			retailer.setId(id);
			retailer = retailerService.get(retailer);
			out.print("销售商名:" + retailer.getName() + "&nbsp;&nbsp;联系电话:" + retailer.getPhone() );
		}
		else {
			out.print("暂无相关资料");
		}
	} catch (Exception e) {
		out.print("<font color=\"red\">查询相关资料出错!</font>");
	}
%>
</html>