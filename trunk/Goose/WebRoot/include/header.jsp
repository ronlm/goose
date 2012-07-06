<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
	<table cellSpacing=0 cellPadding=0 width="100%"
		background="images/header_bg.jpg" border=0>
		<tr height=56>
			<td width=260 style="padding-left: 10px;">
				<font size="3pt" >Goose System</font>
			</td>
			<td style="FONT-WEIGHT: bold; COLOR: #fff; padding-top: 20px;padding-right: 10px;"
				align="right">当前用户：admin &nbsp;&nbsp; <A style="COLOR: #fff"
				href="" target=main>修改密码</A> &nbsp;&nbsp; <A style="COLOR: #fff"
				onclick="confirmExist()"
				href="" target=_top>退出系统</A></td>
			
		</tr>
	</table>
	<table cellSpacing=0 cellPadding=0 width="100%" border=0>
		<tr bgColor=#1c5db6 height=4>
			<td></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	function confirmExist(){
		if (confirm('确定要退出吗？')) 
			return true; 
		else 
			return false;
	}
</script>
</html>
