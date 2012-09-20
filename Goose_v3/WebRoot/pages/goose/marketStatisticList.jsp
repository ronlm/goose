<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<script type="text/javascript" src="../../js/getInfo.js"></script>

<body style="overflow-y: visible;" onload="changeRowColor();">
	<table class="mainTable" id="table">
		<thead>
			<tr class="tableController">
				<th colspan="10">
					<h3>鹅只上市统计信息列表</h3>
					<div class="tableControllerButton">
						今天是&nbsp;${today }&nbsp;日&nbsp;&nbsp;&nbsp; <a class="button"
							href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span> </a>
					</div></th>
			</tr>
			<tr class="tableTitle">
				<th><h3>序号</h3></th>
				<th><h3>农场</h3></th>
				<th><h3>鹅苗交付日期</h3></th>
				<th><h3>交付数量</h3></th>
				<th><h3>现存数量</h3></th>
				<th><h3>存活率</h3></th>
				<th><h3>离90天上市相差天数</h3></th>
				<th width="30%">
					<h3>操作</h3>
				</th>
				<th width="20%">
					<h3>备注</h3>
				</th>
			</tr>
		</thead>
		<tbody id="contentBody">
			<c:forEach items="${pager.data}" var="appearOnMarket" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${appearOnMarket.market.farmName}</td>
					<td>${appearOnMarket.market.receiveDate}</td>
					<td>${appearOnMarket.market.amount}</td>
					<td>${appearOnMarket.gooseNum}</td>
					<td><fmt:formatNumber value="${appearOnMarket.gooseNum/appearOnMarket.market.amount}" maxFractionDigits="4"/></td>
					<td><c:choose>
							<c:when test="${-15 <= appearOnMarket.dayTo90 && appearOnMarket.dayTo90 < 0}">
								<font color="red">${appearOnMarket.dayTo90} &nbsp;应该强制上市！</font>
							</c:when>
							<c:when
								test="${0 <= appearOnMarket.dayTo90 && appearOnMarket.dayTo90 <= 15}">
								<font color="green">${appearOnMarket.dayTo90}天后&nbsp;够期上市</font>
							</c:when>
							<c:when
								test="${appearOnMarket.dayTo90 >15 }">
								${appearOnMarket.dayTo90}天&nbsp;够期上市
							</c:when>
						</c:choose>
					</td>
					<td><a class="button-small"
						value="${appearOnMarket.market.farmId }" name="farmId"><span>获取所属农户农场资料</span>
					</a>
					</td>
					<td>${market.comments}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pager}" />
						</jsp:include>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
<script type="text/javascript">
	function changeDay() {
		$("#changeDayForm").submit();
	}
</script>

</html>
