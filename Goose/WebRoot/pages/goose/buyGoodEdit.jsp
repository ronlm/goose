<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
	<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<body style="overflow-y: visible !important; overflow-y: scroll;">
	<form
		action="${pageContext.request.contextPath }/pages/goose/buyGoodAction!save"
		name="myForm" id="myForm" method="post">
		<table class="mainTable">
			<thead>
				<tr class="tableController">
					<th colspan="3">
						<h3>物资采购记录编辑</h3></th>
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
					<td width="200" align="right">资源名称:</td>
					<td>
						<input type="hidden" name="buyGood.id" value="${buyGood.id }"/>
						<select name="buyGood.goodId" style="width: 100px">
						<c:forEach items="${goodList}" var="good">
							<option value="${good.id }" <c:if test="${buyGood.goodId == good.id }"> selected="selected"</c:if>>${good.name}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200" align="right">供应商姓名:</td>
					<td><select name="buyGood.goodSupplierId" style="width: 100px">
						<c:forEach items="${supplierList}" var="supplier">
							<option value="${supplier.id}" <c:if test="${buyGood.goodSupplierId == supplier.id }"> selected="selected"</c:if>>${supplier.name}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="200" align="right">产地:</td>
					<td><input type="text" name="buyGood.origin" id="origin" value="${buyGood.origin }" /></td>
				</tr>
				<tr>
					<td width="200" align="right">批号:</td>
					<td><input type="text" name="buyGood.batchNum" id="batchNum"  value="${buyGood.batchNum }"/></td>
				</tr>
				<tr>
					<td width="200" align="right">单价:</td>
					<td><input type="text" name="buyGood.unitPrice"  value="${buyGood.unitPrice }" id="unitPrice" validation="required" /></td>
				</tr>
				<tr>
					<td width="200" align="right">数量:</td>
					<td><input type="text" name="buyGood.amount" value="${buyGood.amount }" id="amount" validation="required" " /></td>
				</tr>
				<tr>
					<td width="200" align="right">时间:</td>
					<td><input type="text"  validation="date" readonly="readonly" name="buyGood.date" value="${buyGood.date }" id="date"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/></td>
				</tr>
				<tr>
					<td width="200" align="right">备注:</td>
					<td><textarea rows="5" cols="50" name="buyGood.comments" value="${buyGood.comments }" id="comments">	</textarea></td>
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
