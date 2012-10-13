<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<th colspan="8">
					<h3>当前页面:农场鹅只存栏统计</h3>
						<div class="tableControllerButton">
						全部农场总存栏:&nbsp;&nbsp;${totalStock } &nbsp;只&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						今天是&nbsp;${today }&nbsp;&nbsp;&nbsp;
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span>
						</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>农场</h3></th>
				<th><h3>当前存栏数量</h3></th>
				<th width="20%"><h3>操作</h3></th>
				<th width="30%"><h3>农场备注信息</h3></th>
			</tr>
		</thead>
		<tbody id="contentBody">
			<form action="${pageContext.request.contextPath }/pages/goose/receiveGooseAction!del" name="myForm" id="myForm" method="post">
				<c:forEach items="${pager.data}" var="stock" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${stock.farm.name}</td>
						<td>${stock.stock}</td>
						<td >
							<a class="button" value="${deadInfo.farm.farmerId }" name="farmerId" href="${pageContext.request.contextPath }/pages/goose/deadGooseStatisticAction!deadDetail?farm.id=${stock.farm.id}"><span>存栏明细</span>
						</a>
							<a class="button-small" value="${stock.farm.farmerId }" name="farmerId"><span>获取所属农户资料</span></a></td>
						<td>${stock.farm.comments}</td>
					</tr>
				</c:forEach>
			</form>
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
