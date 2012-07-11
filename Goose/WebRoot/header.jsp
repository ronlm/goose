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
<base href="<%=basePath%>">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
	<table cellSpacing=0 cellPadding=0 width="100%"
		border=0 bgcolor="" >
		<tr height="60px">
			<td width="300px" style="padding-left: 10px;">
				<img alt="logo" src="logo.jpg">
				<font size="10px" color="brown" >农友</font><font size="5px">农林牧</font>&nbsp;信息系统
			</td>
			<td
				style="FONT-WEIGHT: bold;  padding-top: 15px;padding-right: 10px;"
				align="right">当前用户：${userName} &nbsp;&nbsp;
				<a href="" target=main>修改密码</a> &nbsp;&nbsp; 
				<a onclick="confirmExist()" href="" target=_top>退出系统</A>
			</td>

		</tr>
	</table>
	<table cellSpacing=0 cellPadding=0 width="100%" border=0>
		<tr bgColor=#1c5db6 height=4>
			<td></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function confirmExist() {
		if (confirm('确定要退出吗？'))
			return true;
		else
			return false;
	}
</script>
</html>
