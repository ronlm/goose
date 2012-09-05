<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
	<script type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>
	<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
	<body style="overflow-y: visible !important; overflow-y: scroll;">
		<form
			action="${pageContext.request.contextPath }/pages/goose/tradeGooseAction!save"
			name="myForm" id="myForm" method="post">
			<table class="mainTable">
				<thead>
					<tr class="tableController">
						<th colspan="2">
							<h3>
								成品鹅收购信息编辑
							</h3>
						</th>
					</tr>
					<tr>
						<th>
							&nbsp;
						</th>
						<th class="errorTip"
							style='<c:if test="${empty message}">display:none</c:if>'>
							<c:forEach items="${message}" var="m">
								${m }
							</c:forEach>
						</th>
					</tr>
					<tr class="tableTitle">
						<th>
							<h3>
								&nbsp;
							</h3>
						</th>
						<th>
							<h3>
								&nbsp;
							</h3>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="200" align="right">
							日期:
						</td>
						<td>
							<input type="text" readonly="readonly" name="tradeGoose.tradeDate" id="tradeDate" value="${tradeGoose.tradeDate}" />
							<input type="hidden" name="tradeGoose.id" id="id" value="${tradeGoose.id}" />
							<input type="hidden" name="tradeGoose.farmId" id="farmId" value="${tradeGoose.farmId}" />
						</td>
					</tr>
					<tr>
						<td width="200" align="right">
							数量:
						</td>
						<td>
							<input type="text" readonly="readonly" name="tradeGoose.amount" id="amount" value="${tradeGoose.amount}" />
						</td>
					</tr>
					<tr>
						<td width="200" align="right">
							单价:
						</td>
						<td>
							<input type="text" readonly="readonly" name="tradeGoose.unitPrice" id="unitPrice" value="${tradeGoose.unitPrice}" />
						</td>
					</tr>
					<tr>
						<td width="200" align="right">
							总重量:
						</td>
						<td>
							<input type="text" readonly="readonly" name="tradeGoose.totalWeight" id="totalWeight" value="${tradeGoose.totalWeight}" />
						</td>
					</tr>
					<tr>
						<td width="200" align="right">
							备注:
						</td>
						<td>
							<textarea rows="5" cols="50" name="tradeGoose.comments" id="comment">${tradeGoose.comments}	</textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr class="tableController_bottom">
						<td align="center">
							&nbsp;
						</td>
						<td align="left">
							<a class="button" href="javascript:void(0)"
								onclick="this.blur();save();return false;"><span><img
										src="${pageContext.request.contextPath }/js/kui/icons/disk.png"
										align="absmiddle" />&nbsp;保存</span>
							</a>
							<a class="button" href="javascript:void(0)"
								onclick="this.blur(); history.go(-1);return false;"><span><img
										src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
										align="absmiddle" />&nbsp;返回</span>
							</a>
						</td>
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
