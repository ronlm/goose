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

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/admin.css" type="text/css" rel="stylesheet">
</head>
<body>
	<table cellspacing=0 cellpadding=0 width="100%" align=center border=0>
		<tr height=28>
			<td background=images/title_bg1.jpg>当前位置:</td>
		</tr>
		<tr>
			<td bgcolor=#b1ceef height=1></td>
		</tr>
		<tr height=20>
			<td background=images/shadow_bg.jpg></td>
		</tr>
	</table>
	<table cellspacing=0 cellpadding=0 width="90%" align=center border=0>
		<tr height=100>
			<td align=middle width=100><img height=100
				src="images/admin_p.gif" width=90></td>
			<td width=60>&nbsp;</td>
			<td>
				<table height=100 cellspacing=0 cellpadding=0 width="100%" border=0>

					<tr>
						<td>当前时间：2008-12-27 17:03:55</td>
					</tr>
					<tr>
						<td style="FONT-WEIGHT: bold; FONT-SIZE: 16px">admin</td>
					</tr>
					<tr>
						<td>欢迎进入网站管理中心！</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td colspan=3 height=10></td>
		</tr>
	</table>
	<table cellspacing=0 cellpadding=0 width="95%" align=center border=0>
		<tr height=20>
			<td></td>
		</tr>
		<tr height=22>
			<td style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff"
				align=middle background=images/title_bg2.jpg>您的相关信息</td>
		</tr>
		<tr bgcolor=#ecf4fc height=12>
			<td></td>
		</tr>
		<tr height=20>
			<td></td>
		</tr>
	</table>
	<table cellspacing=0 cellpadding=2 width="95%" align=center border=0>
		<tr>
			<td align=right width=100>登陆帐号：</td>
			<td style="COLOR: #880000">admin</td>
		</tr>
		<tr>
			<td align=right>真实姓名：</td>
			<td style="COLOR: #880000">admin</td>
		</tr>
		<tr>
			<td align=right>注册时间：</td>
			<td style="COLOR: #880000">2007-7-25 15:02:04</td>
		</tr>
		<tr>
			<td align=right>登陆次数：</td>
			<td style="COLOR: #880000">58</td>
		</tr>
		<tr>
			<td align=right>上线时间：</td>
			<td style="COLOR: #880000">2008-12-27 17:02:54</td>
		</tr>
		<tr>
			<td align=right>IP地址：</td>
			<td style="COLOR: #880000">222.240.172.117</td>
		</tr>
		<tr>
			<td align=right>身份过期：</td>
			<td style="COLOR: #880000">30 分钟</td>
		</tr>
		<tr>
			<td align=right>网站开发QQ：</td>
			<td style="COLOR: #880000">123456</td>
		</tr>
		<tr>
			<td align=right>源码之家：</td>
			<td style="COLOR: #880000"><a href="http://www.mycodes.net">www.mycodes.net</a>
			</td>
		</tr>
	</table>
</body>
</html>