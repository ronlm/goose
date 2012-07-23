<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
    <body onresize="setContentHeight();">
        <table width="100%"  height="100%">
       	  <tr>
        	<td id="header" height="62" colspan="2" valign="middle" background="${pageContext.request.contextPath }/images/main/BodyBG.gif">
        		<div id="headerLogo">
        			<img src="${pageContext.request.contextPath }/images/main/Logo.jpg"/>
        		</div>
        		<div id="headerMsg">
        			<br/>欢迎您：${sessionScope.loginUser.userName }&nbsp;&nbsp;您的身份是： ${sessionScope.role.name }
        			&nbsp;&nbsp;[<a href="${pageContext.request.contextPath }/login/adminLoginoutAction!get?user.id=${sessionScope.loginUser.id }" target="mainIframe">修改密码</a> | <a href="${pageContext.request.contextPath }/login/adminLoginoutAction!logout">退出登陆</a>]&nbsp;&nbsp;
        		</div>
        		</td>
		  </tr>
       	  <tr id="contentBox">
        	<td valign="top">
			  <div id="leftMenu">
                <!--左栏显示隐藏控制开始-->
                <div id="menuController">
                   	<div id="menuControllerText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 15px; color: #000;">MENU</span></div> 
					<div id="menuControllerArrow" title="显示/隐藏菜单">
                    </div>
                </div>
                <!--左栏显示隐藏控制结束-->
                <!--左栏菜单内容开始-->
               <div id="navigation"> 
               		${menu }
               </div>
               <!--左栏菜单内容结束-->   
            </div>
			</td>
			<td width="100%" valign="top">
				<!--主要内容区域开始-->
				<div id="mainContent">
							<iframe frameborder="no" style="border: none;margin: 0;padding: 0;" name="mainIframe" id="mainIframe" width="100%" scrolling="auto" src="${pageContext.request.contextPath }/pages/main/MainContent.jsp"></iframe>
				</div>
				<!--主要内容区域结束-->
			</td>
       	  </tr>
			
        	<tr>
        	<td height="26" colspan="2" background="${pageContext.request.contextPath }/images/main/BodyBG.gif">
				        <div id="footer">
            版权所有&nbsp;&copy;&nbsp;EnGinE &nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a href="http://www.ege.com.cn" target="_blank">EnGinE</a>
        </div>
			</td>
		  </tr>
        </table>
		<script type="text/javascript">
			var menu = new SlideMenu('menu');
			menu.init();
			
			setContentHeight();//设置中间部分高度
			//菜单显示隐藏
			menuControll();
		</script>
		
</body>
</html>

