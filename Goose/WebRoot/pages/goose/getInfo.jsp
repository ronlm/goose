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
<%
	Farm farm = new Farm();
	FarmService farmService = (FarmService) BeansUtil.get("farmService");
	Farmer farmer = new Farmer();
	FarmerService farmerService = (FarmerService) BeansUtil.get("farmerService");

	try {
		if (request.getParameter("infoType").equals("farmInfo")) {
			Long farmId = Long
					.parseLong(request.getParameter("farmId"));
			farm.setId(farmId);
			farm = farmService.get(farm);

			farmer.setId(farm.getFarmerId());
			farmer = farmerService.get(farmer);
			out.print("农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:"
					+ farmer.getPhone() + "&nbsp;&nbsp;农场名："
					+ farm.getName() + "&nbsp;&nbsp;地址:"
					+ farm.getAddress());

		} else if (request.getParameter("infoType")
				.equals("farmerInfo")) {
			Long farmerId = Long.parseLong(request
					.getParameter("farmerId"));
			farmer.setId(farmerId);
			farmer = farmerService.get(farmer);
			out.print("农户名:" + farmer.getName() + "&nbsp;&nbsp;电话:"
					+ farmer.getPhone() + "&nbsp;&nbsp;住址:"
					+ farmer.getAddress());
		} else {
			out.print("暂无相关资料");
		}
	} catch (Exception e) {
		out.print("<font color=\"red\">查询相关资料出错!</font>");
	}
%>
</html>