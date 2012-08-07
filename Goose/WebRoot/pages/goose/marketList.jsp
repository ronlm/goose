<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>

<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>


<body style="overflow-y: visible;" onload="changeRowColor();">
	<table class="mainTable" id="table" >
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>鹅只上市统计信息列表</h3>
						<div class="tableControllerButton">
						今天是&nbsp;${today }&nbsp;日&nbsp;&nbsp;&nbsp;
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span>
						</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th><h3>农场</h3></th>
				<th><h3>鹅苗交付日期</h3></th>
				<th><h3>交付数量</h3></th>
				<th><h3>现存数量</h3></th>
				<th><h3>离90天上市相差天数</h3></th>
				<th width="20%">
					<h3>操作</h3></th>
				<th width="30%">
					<h3>备注</h3></th>
			</tr>
		</thead>
		<tbody id="contentBody">
				<c:forEach items="${pager.data}" var="appearOnMarket" >
					<tr>
						<td>${appearOnMarket.market.farmName}</td>
						<td>${appearOnMarket.market.receiveDate}</td>
						<td>${appearOnMarket.market.amount}</td>			
						<td>${appearOnMarket.gooseNum}</td>
						<td>${appearOnMarket.dayTo90}</td>
						<td><a class="button-small" href="javascript:void(0)"
							onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/receiveGooseAction!get?receiveGoose.id=${receiveGoose.id }'; return false;"><span>查看农户联系方式</span>
						</td>
						<td>${market.comments}</td>
					</tr>
				</c:forEach>
		</tbody>
		<tfoot >
			<tr class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pager}" />
						</jsp:include>
					</div></td>
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
