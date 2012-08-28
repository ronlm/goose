<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
	
		<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
		<link charset="UTF-8" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/tap.css"/>
		<script type="text/javascript" src="/js/tab.js"></script>
		<script type="text/javascript" src="/js/jquery-1.3.2.min.js"></script>
		<script language="javascript" type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>

	<body style="overflow-y: visible !important; overflow-y: scroll;">
		<table class="mainTable">
		<thead>
			<tr class="tableController">
				<th colspan="11">
					<h3>记录检索</h3>
					<div class="tableControllerButton">
						记录类型:
							<input type="radio" name="picno" value="1">鹅苗交付&nbsp;
							<input type="radio" name="picno" value="2">成品鹅收购&nbsp;
							<input type="radio" name="picno" value="3">成品鹅销售&nbsp;
							<input type="radio" name="picno" value="1">物资采购&nbsp; 
							<input type="radio" name="picno" value="1">物资出售
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							鹅（物资）数量&nbsp;
							<input type="text" value="0" style="width: 40px"/>&nbsp;~&nbsp;<input type="text" value="不限" style="width: 40px"/>
							从&nbsp;&nbsp;<input type="text"  validation="date" readonly="readonly" name="buyGood.date" value="2012-1-1"id=date  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/> 
							&nbsp;
							到&nbsp;<input type="text"  validation="date" readonly="readonly" name="buyGood.date" value="2012-8-29"id=date  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/>
							&nbsp;&nbsp;
							<a class="button-small" ><span>&nbsp;确 定&nbsp;</span> </a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				                   
			</tr>
		</thead>
		<tbody>
		
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
</html>
