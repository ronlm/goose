<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../../js/tab.js"></script>
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
    <link charset="UTF-8" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tap.css"/>
  <body style="overflow-y: visible;" onload="changeRowColor();">
    	<table class="mainTable">
		<thead>
				<tr class="tableController">
				<th colspan="1">
					<h3>当前页面:鹅只信息统计</h3>
				</th>
			</tr>
		</thead>
		<tbody>	
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<input type="hidden" name="pageContext" value="${pageContext.request.contextPath }">
	<ul id="tab">
				<li class="tabin">鹅只上市信息</li>
				<li>鹅只死亡信息统计</li>
				<li>存栏鹅只统计</li>
			</ul>
			<div id="content">
				<img alt="装载中" src="images/img-loading.gif" />
				<div id="realcontent"></div>
			</div>
  </body>
  
  <script type="text/javascript">
	function changeDay(){
			$("#changeDayForm").submit();
	}
</script>
</html>
