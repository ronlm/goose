<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
					<h3>${farm.name}&nbsp;农场存栏鹅只死亡时间列表</h3>
					<div class="tableControllerButton">
							最近 ${daysWithin }天内该批次鹅只非正常死亡时间列表&nbsp;&nbsp;&nbsp;
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span> </a>
								</br>
						
					</div>
				</th>
				<tr>
					<td>农场:${farm.name }&nbsp;&nbsp;地址:${farm.address }&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>该鹅苗批次信息&nbsp;&nbsp;&nbsp;&nbsp;交付日期:${receiveGoose.receiveDate }&nbsp;&nbsp;交付数量:${receiveGoose.amount }&nbsp;&nbsp;&nbsp;&nbsp;合计死亡数量:${total }只</td>
				</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>鹅只脚环ID号</h3></th>
				<th><h3>死亡时间</h3></th>
		</thead>
		<tbody id="contentBody" style="overflow: auto;height:1200px"> 
				<c:forEach items="${pager.data}" var="deadGoose" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${deadGoose.ringId }</td>
						<td>${deadGoose.deadDate }</td>
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
