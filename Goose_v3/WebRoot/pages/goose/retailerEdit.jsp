<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
	<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
	<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
	<body style="overflow-y: visible !important; overflow-y: scroll;">
		<form
			action="${pageContext.request.contextPath }/pages/goose/retailerAction!save"
			name="myForm" id="myForm" method="post">
			<table class="mainTable">
				<thead>
					<tr class="tableController">
						<th colspan="2">
							<h3>
								销售商信息编辑
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
						<th><h3>&nbsp;</h3></th>
						<th><h3>&nbsp;</h3>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="200" align="right">
							销售商名称:
						</td>
						<td>
							<input type="text" validation="required" name="retailer.name"
								id="name" value="${retailer.name}" />
							<input type="hidden" name="retailer.id" id="id" value="${retailer.id}" />
						</td>
					</tr>
					<tr>
					<td width="200px" align="right" >所属销售分区:</td>
					<td><select name="retailer.regionId" id="regionId" style="width: 150px" >
						<c:forEach items="${saleRegionList}" var="saleRegion">
							<option value="${saleRegion.id}" 
								<c:if test="${retailer.region == saleRegion.region }">selected="selected" 
								</c:if>>${saleRegion.region}</option>
						</c:forEach>
					</select></td>
				</tr>
					<tr>
						<td width="200" align="right">
							联系电话:
						</td>
						<td>
							<input type="text"  name="retailer.phone" id="phone" value="${retailer.phone}" />
						</td>
					</tr>
					<tr>
						<td width="200" align="right">
							地址:
						</td>
						<td>
							<input type="text"  name="retailer.address" id="address" value="${retailer.address}" />
						</td>
					</tr>
					<tr>
						<td width="200" align="right">
							备注:
						</td>
						<td>
							<textarea rows="5" cols="50" name="retailer.comments" id="comments">${retailer.comments}	</textarea>
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
