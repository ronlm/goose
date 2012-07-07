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
<title>Goose 系统登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>

<body onload=document.form1.userName.focus();>
	<table height="100%" cellspacing=0 cellpadding=0 width="100%"
		bgcolor=#002779 border=0>
		<tr>
			<td align="center">
				<table cellspacing=0 cellpadding=0 width=468 border=0>
					<tr>
						<td><img height=23 src="images/login_1.jpg" width=468>
						</td>
					</tr>
					<tr>
						<td><img height=147 src="images/login_2.jpg" width=468>
						</td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=468 bgcolor=#ffffff
					border=0>
					<tr>
						<td width=16><img height=122 src="images/login_3.jpg"
							width=16>
						</td>
						<td align="center">
							<form name="form1" action="/User/UserAction!login" method="post">
								<table cellspacing=0 cellpadding=0 width=230 border=0>
									<tr height="5px">
										<td width=5></td>
										<td width=56></td>
										<td></td>
									</tr>
									<tr height="36px">
										<td></td>
										<td>用户名</td>
										<td><input type="text" name="userName" maxlength="30"
											size="24px" height="20px"></td>
									</tr>
									<tr height="36px">
										<td>&nbsp;</td>
										<td>密 码</td>
										<td><input type="password" name="password" maxlength="30"
											size="24">
										</td>
									</tr>
									<tr height="20px">
										<td></td>
										<td></td>
										<td><a href="#"><font color="red">忘记密码？</font> </a></td>
									</tr>
									<tr style="padding-top: 3px">
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><input type=image height="30px" width=70
											src="images/login_Btn.png">
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
<script type="text/javascript">
	function mylogin() {
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		if (userName == '' || userName.length == 0) {
			document.getElementById("errorMsg").style.display = "";
			document.getElementById("errorMsg").innerHTML = "用户名不能空！";
			return;
		} else if (password == '' || password.length == 0) {
			document.getElementById("errorMsg").style.display = "";
			document.getElementById("errorMsg").innerHTML = "密码不能空！";
			return;
		} else if (userName.length > 0 && password.length > 0) {
			document.getElementById("formId").submit();
		}
	}
	function enterDown(event) {
		if (event.keyCode == '13') {
			mylogin();
		}
	}

	function myRefresh() {
		if (parent) {
			var url = parent.location.href;
			if (url.indexOf("adminLoginout.do") == -1
					&& url.indexOf("Login.jsp") == -1) {
				parent.location.href = '${pageContext.request.contextPath}/Login.jsp';
			}
		}
	}
	myRefresh();
</script>
</html>
