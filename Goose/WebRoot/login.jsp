<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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

	<body bgcolor="#a7e3e3" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="document.getElementById('userName').focus();">
		<form id="formId"	action=" " style="width: 100%;  text-align: center;" method="POST" onKeyPress="enterDown(event);">
			<table height="735" style="width: 100%; text-align: center;" border="0" cellpadding="0" background="images/login/login_02.jpg">
				<tr>
					<td align="center" valign="middle">
						<table width="575" height="340" border="0" cellpadding="0" cellspacing="0" align="center">
							<tr>
								<td height="213" colspan="3" background="images/login/login_03.jpg"></td>
							</tr>
							<tr>
								<td width="11" height="70" background="images/login/login_05.jpg">
								</td>
								<td width="552" align="center" valign="top" background="images/login/login_06.jpg" style="font-size: 12px; color: #00547c;">
									<table width="100%" border="0"
										cellspacing="0" cellpadding="0" style="margin-top: 5px;">
										
										<tr>
											<td width="11%" align="right"
												style="font-size: 12px; color: #00547c;">
												用户名：
											</td>
											<td width="16%" align="left">
												<input type="text" name="user.userName" id="userName" style="font-size: 18px; font_family: Georgia,serif,微软雅黑; width: 140px; height: 30px; color: #00547c; border: 2px solid #20b8de; line-height: 30px; padding-left: 3px;">
											</td>
											<td width="9%" align="right" style="font-size: 12px; color: #00547c;">
												密码：
											</td>
											<td width="16%" align="left">
												<input  type="password" name="user.password" id="password" style="font-size: 8px; width: 140px; height: 30px; color: #00547c; border: 2px solid #20b8de; line-height: 30px; padding-left: 3px;">
											</td>
											<td width="12%" align="right">
												<input type="button" value="提交" onclick="mylogin();">
											</td>
											<td width="4%" align="right">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
								<td width="12" height="70" background="images/login/login_07.jpg"></td>
							</tr>
							<tr>
								<td></td>
								<td align="center" style="font-size: 12px; color: #00547c; line-height: 20px;font-family:arial, verdana, sans-serif; ">
									版权所有&nbsp;&copy;&nbsp; TeamBobcat
									<br />
									技术支持：
									<a href="#" target="_blank">TeamBobcat</a>
								</td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
  	<script type="text/javascript">
	function mylogin(){
		var userName = document.getElementById("userName").value;
		var password = document.getElementById("password").value;
		if(userName == '' || userName.length == 0){
			document.getElementById("errorMsg").style.display="";
			document.getElementById("errorMsg").innerHTML="用户名不能空！";
			return;
		}else if(password == '' || password.length == 0){
			document.getElementById("errorMsg").style.display="";
			document.getElementById("errorMsg").innerHTML="密码不能空！";
			return;
		}else if(userName.length > 0 && password.length > 0){
			document.getElementById("formId").submit();
		}
	}
	function enterDown(event){
		if(event.keyCode == '13'){
			mylogin();
		}
	}
		
	function myRefresh(){
		if(parent){
			var url = parent.location.href;
			if(url.indexOf("adminLoginout.do") == -1 && url.indexOf("Login.jsp") == -1 ){
				parent.location.href= '${pageContext.request.contextPath}/Login.jsp';
			}
		}
	}
	myRefresh();
</script>
</html>
