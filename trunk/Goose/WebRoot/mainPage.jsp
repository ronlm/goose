<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Goose Systr</title>
<meta http-equiv=content-type content="text/html; charset=gb2312">
<meta http-equiv=pragma content=no-cache>
<meta http-equiv=cache-control content=no-cache>
<meta http-equiv=expires content=-1000>
<link href="css/admin.css" type="text/css" rel="stylesheet">
</head>
<frameset border="0" framespacing="0" rows="60, *" frameborder="no">
	<frame name=header src="header.jsp" frameborder="0" noresize scrolling=no>
	<frameset cols="170, *">
		<frame name=menu src="menu.jsp" frameborder=0 noresize>
		<frame name=main src="main.jsp" frameborder=0 noresize scrolling=yes>
	</frameset>
</frameset>
<noframes>
</noframes>
</html>
