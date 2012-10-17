<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<script type="text/javascript" src="../../js/getInfo.js"></script>
<%-- 对每个农场的当前存栏的所以鹅苗接收批次 ReceiveGoose 分别作死亡数字统计，同时计算各自的存活率--%>
<body  onload="changeRowColor();">
	<table class="mainTable" id="table" >
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>当前页面:存栏明细&nbsp;&nbsp;&nbsp;&nbsp;当前农场:${farm.name}</h3>
					<div class="tableControllerButton">
						<form name="changeDayForm" id="changeDayForm"
							action="${pageContext.request.contextPath }/pages/goose/deadGooseStatisticAction!deadDetail"
							method="post">
							最近
							  <select name="daysSelect" id="daysSelect" style="width:80px;border: solid,1px" onchange="document.getElementById('daysWithin').value=this.value;">  
								  <option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3</option>
								  <option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7</option>
								  <option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>14</option>
								  <option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30</option>
								  <option value="60" <c:if test="${daysWithin == 60 }">selected="selected"</c:if>>60</option>
								  <option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90</option>
								  <option value="120" <c:if test="${daysWithin == 120 }">selected="selected"</c:if>>120</option>
								  <option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>365</option>
								  <option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							  </select>  
							  天内农场进场批次死亡鹅只统计&nbsp;&nbsp;&nbsp;&nbsp;
							  自定义天数:
							  <input type="text" id="daysWithin" name="daysWithin" value="${daysWithin }" style="width:80px;border:border:1px solid #fff000;">  
							天&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="button" id="confirm" onclick="submitForm();"><span>&nbsp;确 定&nbsp;</span></a>
							<input type="hidden" name="farm.id" id="FarmId" value="${farm.id }"/>							
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span> </a>
								
						</form>
					</div></th>
			</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>鹅苗进场时间</h3></th>
				<th><h3>进场数量</h3></th>
				<th><h3>现存数量</h3></th>
				<th><h3>死亡数量</h3></th>
				<th><h3>存活率</h3></th>
				<th><h3>死亡的鹅只脚环ID号</h3></th>
				<th><h3>操作</h3></th>
		</thead>
		<tbody id="contentBody" style="overflow: auto;height:1200px"> 
				<c:forEach items="${pager.data}" var="deadDetail" varStatus="status">
					<tr >
						<td>${status.count}</td>
						<td>${deadDetail.receiveGoose.receiveDate}</td>
						<td>${deadDetail.receiveGoose.amount}</td>
						<td>${deadDetail.currentNum}</td>
						<td>${deadDetail.deadNum}</td>
						<td><fmt:formatNumber value="${deadDetail.surviveRate}" maxFractionDigits="4"/></td>
						<td >
							<div style="overflow:auto;<c:if test="${deadDetail.deadNum >10 }">height:150px;</c:if>">
								<c:forEach items="${deadDetail.deadGooses }" var="goose"varStatus="num">
									${goose.ringId }&nbsp;;
								<c:if test="${num.count % 10 == 0 }"></br></c:if>
								</c:forEach>
							</div>
						</td>
						<td><a class="button"  name="deadGooselist" 
						href="${pageContext.request.contextPath }/pages/goose/deadGooseStatisticAction!deadGooseList?daysWithin=${daysWithin }&&receiveGoose.id=${deadDetail.receiveGoose.id}"><span>死亡鹅只时间</span>
						</a>
						</td>
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
function submitForm(){
	if(isNaN(document.getElementById('daysWithin').value)){
		alert("只能输入为1-3位的数字,若出错则返回上页重新输入！");
		document.getElementById('daysWithin').focus();
		return false;
	}
	else{
		if(document.getElementById('daysWithin').value > 365){
			alert("请输入小于365的数字！");
			document.getElementById('daysWithin').focus();
			return false;
		}
		else $("#changeDayForm").submit();
	}
	return false;
}
</script>

</html>
