<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/admin.css" type="text/css" rel="stylesheet">
<script language=javascript>
	function expand(el) {
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none') {
			childObj.style.display = 'block';
		} else {
			childObj.style.display = 'none';
		}
		return;
	}
</script>
</head>
<body>
	<table height="100%" cellspacing=0 cellpadding=0 width=170
		background=images/menu_bg.jpg border=0>
		<tr>
			<td valign=top align="center">
				<table cellspacing=0 cellpadding=0 width="100%" border=0>

					<tr>
						<td height=10></td>
					</tr>
				</table>			
				<table cellspacing=0 cellpadding=0 width=150 border=0>

					<tr height=22>
						<td style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><a
							class=menuparent onclick=expand(1) href="javascript:void(0);">信息管理</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table>
				<table id=child1 style="DISPLAY: none" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="main.jsp" target=main>农户信息</a>
						</td>
					</tr>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="#" target=main>技术人员信息</a>
						</td>
					</tr>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="#" target=main>药品信息</a>
						</td>
					</tr>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="#" target=main>鹅只信息</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
				</table>
				
				<table cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=22>
						<td style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><a
							class=menuparent onclick=expand(7) href="javascript:void(0);">系统管理</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table>
				<table id=child7 style="DISPLAY: none" cellspacing=0 cellpadding=0
					width=150 border=0>

					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="#" target=main>基本设置</a>
						</td>
					</tr>				
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="#" target=main>管理员列表</a>
						</td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=150 border=0>

					<tr height=22>
						<td style="PADDING-LEFT: 30px" background=images/menu_bt.jpg><a
							class=menuparent onclick=expand(0) href="javascript:void(0);">个人账户管理</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table>
				<table id=child0 style="DISPLAY: none" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild href="#" target=main>修改口令</a>
						</td>
					</tr>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="images/menu_icon.gif" width=9>
						</td>
						<td><a class=menuchild onclick="confirmExist();"
							href="http://www.mycodes.net" target=_top>退出系统</a>
						</td>
					</tr>
				</table>
			</td>
			<td width=1 bgcolor=#d1e6f7></td>
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