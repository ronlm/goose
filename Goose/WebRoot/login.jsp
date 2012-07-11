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

<title>Goose System 登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css" rel="stylesheet">
body {
	margin:0px;
	font-size: 12px;
	line-height: 150%; 
	font-family: "verdana", "arial", "helvetica", "sans-serif"
}
td {
	font-size: 12px;
	
}

a {
	color: 0071a8;
	text-decoration: none;
}

a:hover {
	color: #CC3300;
	text-decoration: none;
}

#errorMsg {
	text-align: center;
	font-size: 12px;
	color: red;
}
</style>

</head>

<body onload=document.form1.userName.focus();>
	<table height="100%" cellspacing=0 cellpadding=0 width="100%"
		bgcolor=#AA9F55>
		<tr>
			<td align="center">
				<table cellspacing=0 cellpadding=0 width=468 border=0>
					<tr>
						<td><img height=147 src="images/login_2.jpg" width=468>
						</td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 bgcolor=#ffffff
					border=0>
					<tr>
						<td width=16><img src="images/login_3.jpg" width=16>
						</td>
						<td align="center">
							<form name="form1" action="/User/userAction!login" method="post">
								<table cellspacing=0 cellpadding=0 width=230 border=0>
									<tr height="30px">
										<td></td>
										<td>用户名</td>
										<td><input type="text" name="userName" maxlength="30"
											size="24"></td>
									</tr>
									<tr height="36px">
										<td>&nbsp;</td>
										<td>密 码</td>
										<td><input type="password" name="password" maxlength="30"
											size="24"></td>
									</tr>
									<tr height="20px">
										<td></td>
										<td></td>
										<td><a href="#"><font color="red">忘记密码？</font> </a></td>
									</tr>
									<tr style="padding-top: 3px">
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><input type="submit" value="登  录">&nbsp;&nbsp;&nbsp;<input
											type="reset" value="重  置">
										</td>
									</tr>
								</table>
							</form>
						</td>
						<td width=16><img height=122 src="images/login_4.jpg"
							width=16>
						</td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 border=0>
					<tr>
						<td><img height=16 src="images/login_5.jpg" width=468>
						</td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 border=0
					style="padding-top: 10px;">
					<tr>
						<td align=right><a href="#" target=_blank><font
								color="white" size="3">联系我们</font> </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
