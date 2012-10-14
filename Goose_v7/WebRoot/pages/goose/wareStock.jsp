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
					<h3>公司目前已回购但未出售鹅只</h3>
					<div class="tableControllerButton">
							<p>公司目前已回购但未出售鹅只数目:<font color="red">${wareGoose }</font></p>
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
