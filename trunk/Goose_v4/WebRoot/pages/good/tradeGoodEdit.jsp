<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<body style="overflow-y: visible !important; overflow-y: scroll;">
	<form action="${pageContext.request.contextPath }/pages/good/tradeGoodAction!save" name="myForm" id="myForm" method="post">
		<table class="mainTable">
			<thead>
				<tr class="tableController">
					<th colspan="3">
						<h3>编辑物资销售记录</h3></th>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<th class="errorTip"
						style='<c:if test="${empty message}">display:none</c:if>'><c:forEach
							items="${message}" var="m">
								${m }
							</c:forEach></th>
				</tr>
				<tr class="tableTitle">
					<th>
						<h3>&nbsp;</h3></th>
					<th>
						<h3>&nbsp;</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="200px" align="right">物资品名:</td>
					<td>
					<input type="hidden" name="tradeGood.id" id="id" value="${tradeGood.id }"/>
					<select name="tradeGood.goodId"  style="width: 100px">
						<c:forEach items="${goodList}" var="good">
							<option value="${good.id}" <c:if test="${tradeGood.goodId == good.id }"> selected="selected"</c:if>>${good.name}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200px" align="right" >农户姓名:</td>
					<td><select name="tradeGood.farmerId" style="width: 80px">
						<c:forEach items="${farmerList}" var="farmer">
							<option value="${farmer.id}" <c:if test="${tradeGood.farmerId == farmer.id }"> selected="selected"</c:if>>${farmer.name}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200" align="right">单价:</td>
					<td><input type="text" name="tradeGood.unitPrice" id="unit" value="${tradeGood.unitPrice }" validation="required" /></td>
				</tr>
				<tr>
					<td width="200" align="right">数量:</td>
					<td><input type="text" name="tradeGood.amount" id="unit" value="${tradeGood.amount }" validation="required" /></td>
				</tr>
				<tr>
					<td width="200" align="right">时间:</td>
					<td><input type="text"  value="${tradeGood.tradeDate }" validation="date" readonly="readonly" name="tradeGood.tradeDate" id="tradeDate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/></td>
				</tr>
				<tr>
					<td width="200" align="right">备注:</td>
					<td><textarea rows="5" cols="50" name="tradeGood.comments" id="comments">${tradeGood.comments }	</textarea></td>
				</tr>

			</tbody>
			<tfoot>
				<tr class="tableController_bottom">
					<td align="center">&nbsp;</td>
					<td align="left"><a class="button" href="javascript:void(0)"
						onclick="this.blur();save();return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/disk.png"
								align="absmiddle" />&nbsp;保存</span> </a> <a class="button"
						href="javascript:void(0)"
						onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回</span> </a></td>
				</tr>
			</tfoot>
		</table>
	</form>
	<script type="text/javascript">
		var formId = 'myForm';
		var valid = new KUI.Validation({
			formId : formId,
			immediate : true
		});
		function save() {
			if (valid.validate()) {
				document.getElementById(formId).submit();
			}
		}
	</script>
</body>
</html>
