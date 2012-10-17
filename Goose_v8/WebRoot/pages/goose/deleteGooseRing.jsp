<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
	
		<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
		<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="../../js/search.js"></script>
		<script type="text/javascript" src="../../js/getInfo.js"></script>
		<script  type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>

	<body style="overflow-y: visible !important; overflow-y: scroll;">
		<table class="mainTable">
		<thead>
			<tr class="tableController">
				<th colspan="11">
					<h3>数据删除</h3>
					<div class="tableControllerButton">
							<form action="${pageContext.request.contextPath }/pages/goose/deleteAction!delete">
								<input type="submit" value="删除两年前鹅只脚环数据">
							</form>
							
							<p>${message}</p>
					</div>
				</th>
			</tr>
			
		</thead>
		<tbody id="tbody" style="border-style: solid;border: 1px;">	
		</tbody>
		<tfoot>
			
		</tfoot>
	</table>
	</body>
</html>
