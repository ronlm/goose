<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
    <script type="text/javascript" src="../../js/getInfo.js"></script>
  <body style="overflow-y: visible;" onload="changeRowColor();">
    	<table class="mainTable">
		<thead>
				<tr class="tableController">
				<th colspan="10">
					<h3><c:if test="${farm != null }">${farm.name }农场的</c:if>收购成品鹅信息列表</h3>
						<div class="tableControllerButton">
						<form name="changeDayForm" id="changeDayForm" action="${pageContext.request.contextPath }/pages/goose/tradeGooseAction!list" method="post">
							最近
							<select name="daysWithin" id="daysWithin" style="width: 70px" onchange="changeDay();" >
								<option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3天</option>
								<option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7天</option>
								<option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>两周</option>
								<option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30天</option>
								<option value="60" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>60天</option>
								<option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90天</option>
								<option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>一年</option>
								<option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							</select>
							天内收购信息
							<c:if test="${farm != null }"><input type="hidden" name="farm.id" id="farm.id" value="${farm.id }" /></c:if>
						</form>
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span>
						</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th>
					<h3><input type="checkbox" onclick="selectAll(this);" /></h3>
				</th>
				<th width="80px"><h3>日期</h3></th>
				<th><h3>数量</h3></th>
				<th><h3>单价</h3></th>
				<th><h3>总重量</h3></th>
				<th><h3>金额合计</h3></th>
				<th width="30%"><h3>操作</h3></th>
				<th width="25%"><h3>备注</h3></th>
			</tr>
		</thead>
		<tbody>
		<form action="${pageContext.request.contextPath }/pages/goose/tradeGooseAction!del" name="myForm" id="myForm" method="post">
			<input type="hidden" name="GetInfoContextPath" id="GetInfoContextPath" value="${pageContext.request.contextPath }/GetInfo"/>
			<c:forEach items="${pager.data}" var="tradeGoose">
				<tr>
					<td width="20px"><input type="checkbox" name="id" value="${tradeGoose.id}"/></td>
					<td>${tradeGoose.tradeDate}</td>
					<td>${tradeGoose.amount}</td>
					<td><fmt:formatNumber value="${tradeGoose.unitPrice }" maxFractionDigits="3"/></td>
					<td><fmt:formatNumber value="${tradeGoose.totalWeight }" maxFractionDigits="3"/></td>
					<td><fmt:formatNumber value="${tradeGoose.unitPrice * tradeGoose.totalWeight}" maxFractionDigits="3"/></td>
					<td >
						<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/tradeGooseAction!get?tradeGoose.id=${tradeGoose.id }'; return false;"><span>修改</span></a>
						<a class="button-small" value="${tradeGoose.farmId }" name="farmId"><span>获取农户农场资料</span></a>
					</td>
					<td>${tradeGoose.comments}</td>
				</tr> 
			</c:forEach>
		</form>
		</tbody>
		<tfoot>
			<tr  class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pager}"/>
						</jsp:include>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
  </body>
  
  <script type="text/javascript">
	function changeDay(){
			$("#changeDayForm").submit();
	}
</script>
</html>
