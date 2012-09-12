<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<script type="text/javascript" src="../../js/getInfo.js"></script>
<%-- 对每个农场的当前存栏的所以鹅苗接收批次分别作死亡数字统计，同时计算各自的存活率--%>
<body  onload="changeRowColor();">
	<table class="mainTable" id="table" >
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>${farm.name} xx 农场存栏鹅只批次死亡信息统计</h3>
					<div class="tableControllerButton">
						<form name="changeDayForm" id="changeDayForm"
							action="${pageContext.request.contextPath }/pages/goose/gooseStatisticAction!dead"
							method="post">
							查看最近 <select name="daysWithin" id="daysWithin"
								style="width: 70px" onchange="changeDay();">
								<option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3天</option>
								<option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7天</option>
								<option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>两周</option>
								<option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30天</option>
								<option value="60" <c:if test="${daysWithin == 60 }">selected="selected"</c:if>>60天</option>
								<option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90天</option>
								<option value="120" <c:if test="${daysWithin == 120 }">selected="selected"</c:if>>120天</option>
								<option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>一年</option>
								<option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							</select> 天内所有农场鹅只非正常死亡信息&nbsp;&nbsp;&nbsp;

						</form>
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span> </a>
					</div></th>
			</tr>
			<tr class="tableTitle">
				<th><h3>序号</h3></th>
				<th><h3>交付鹅苗时间</h3></th>
				<th><h3>数量</h3></th>
				<th><h3>现存数量</h3></th>
				<th><h3>死亡数量</h3></th>
				<th><h3>存活率</h3></th>
				<th><h3>死亡的鹅只脚环ID号</h3></th>
				<th width="25%"><h3>操作</h3></th>
		</thead>
		<tbody id="contentBody" style="overflow: auto;height:1200px">
		<!-- 
			<form
				action="${pageContext.request.contextPath }/pages/goose/receiveGooseAction!del"
				name="myForm" id="myForm" method="post">
				<c:forEach items="${pager.data}" var="deadInfo" varStatus="status">
					<tr >
						<td>${status.count}</td>
						<td>${deadInfo.farm.name}</td>
						<td>${deadInfo.deadNum}</td>
						<td >
							<div style="overflow:auto;<c:if test="${deadInfo.deadNum >10 }">height:150px;</c:if>">
								<c:forEach items="${deadInfo.deadGooses }" var="goose"varStatus="num">
									${goose.ringId }&nbsp;;
								<c:if test="${num.count % 9 == 0 }"></br></c:if>
								</c:forEach>
							</div>
						</td>
						<td><a class="button"
							value="${deadInfo.farm.farmerId }" name="farmerId" href=""><span>存栏明细</span>
						</a><a class="button-small"
							value="${deadInfo.farm.farmerId }" name="farmerId"><span>获取所属农户资料</span>
						</a>
						</td>
					</tr>
				</c:forEach>
			</form>
			 -->
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
