<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
    <script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
  <body style="overflow-y: visible;" onload="changeRowColor();">
    	<table class="mainTable">
		<thead>
			<tr class="tableController">
				<th colspan="11">
					<h3>物资采购记录</h3>
					<div class="tableControllerButton">
						<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/good/buyGoodAction!get'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_add.png" align="absmiddle"/>&nbsp;添加</span></a>
						<form name="form" id="form" action="${pageContext.request.contextPath }/pages/good/buyGoodAction!list" method="post">
							选择物资类型:&nbsp;
							<select name="goodTypeId" id="goodTypeId" style="width: 100px" >
								<option value="-1">全部</option>
								<c:forEach items="${goodTypeList}" var="goodType">
								<option value="${goodType.id}" 
								<c:if test="${selectGoodTypeId == goodType.id }">selected="selected" </c:if>>${goodType.name}</option>
								</c:forEach>
							</select>
							&nbsp;&nbsp;&nbsp;
							选择供应商:&nbsp;
							<select name="selectedGoodSupplier.id" style="width: 150px">
								<option value="-1">全部</option>
								<c:forEach items="${goodSupplierList}" var="supplier">
								<option value="${supplier.id}" <c:if test="${selectedGoodSupplier.id == supplier.id }"> selected="selected"</c:if>>${supplier.name}</option>
								</c:forEach>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;
							最近
							<select name="daysWithin" id="daysWithin" style="width: 70px" >
								<option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3天</option>
								<option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7天</option>
								<option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>两周</option>
								<option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30天</option>
								<option value="60" <c:if test="${daysWithin == 60 }">selected="selected"</c:if>>60天</option>
								<option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90天</option>
								<option value="120" <c:if test="${daysWithin == 120 }">selected="selected"</c:if>>120天</option>
								<option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>一年</option>
								<option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							</select>
							天内销售记录
							<a class="button" id="confirm" onclick="submitForm();"><span>&nbsp;确 定&nbsp;</span> </a>			
						</form>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>资源名称</h3></th>
				<th><h3>供应商</h3></th>
				<th><h3>产地</h3></th>
				<th><h3>批号</h3></th>
				<th><h3>单价(元)</h3></th>
				<th><h3>数量</h3></th>
				<th><h3>总价(元)</h3></th>
				<th><h3>时间</h3></th>
				<th width="20%"><h3>备注</h3></th>   
				<th width="20%"><h3 >操作</h3></th>                        
			</tr>
		</thead>
		<tbody>
		<form action="${pageContext.request.contextPath }/pages/good/tradeGooseAction!del" name="myForm" id="myForm" method="post">
			<c:forEach items="${pager.data}" var="buyGoodView" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${buyGoodView.goodName}</td>
					<td>${buyGoodView.supplierName}</td>
					<td>${buyGoodView.origin}</td>
					<td>${buyGoodView.batchNum}</td>
					<td><fmt:formatNumber value="${buyGoodView.unitPrice}" maxFractionDigits="3"/></td>
					<td>${buyGoodView.amount}</td>
					<td><fmt:formatNumber value="${buyGoodView.unitPrice * buyGoodView.amount}" maxFractionDigits="3"/></td>
					<td>${buyGoodView.date}</td>
					<td>${buyGoodView.comments}</td>
					<td>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/good/buyGoodAction!get?buyGood.id=${buyGoodView.id }'; return false;"><span>修改</span></a>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); deleteOne('${pageContext.request.contextPath }/pages/good/buyGoodAction!del?id=${buyGoodView.id }'); return false;"><span>删除</span></a>
					</td>
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
	function submitForm(){
			$("#form").submit();
	}
</script>
</html>
