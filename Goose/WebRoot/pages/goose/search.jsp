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
					<h3>记录检索</h3>
					<div class="tableControllerButton">
						记录类型:
							<input type="radio" name="searchType" value="receiveGoose" checked="checked">鹅苗交付&nbsp;
							<input type="radio" name="searchType" value="tradeGoose">成品鹅收购&nbsp;
							<input type="radio" name="searchType" value="saleGoose">成品鹅销售&nbsp;
							<input type="radio" name="searchType" value="buyGood">物资采购&nbsp; 
							<input type="radio" name="searchType" value="tradeGood">物资出售
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							鹅（物资）数量&nbsp;
							<a class="button" id="numberEdit" name="numberEdit"><span>&nbsp;不限&nbsp;</span> </a>
							<span id="numEditDiv">
								<input type="text" id="fromNum" name="fromNum" value="不限" validation="number" style="width: 80px"/>&nbsp;
								~&nbsp;
								<input type="text" id="toNum" name="toNum" value="不限" validation="number" style="width: 80px"/>
							</span>&nbsp;&nbsp;
							从&nbsp;&nbsp;
							<input type="text"  validation="date" readonly="readonly" id="fromDate" name="fromDate" value="2012-01-01" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/> 
							&nbsp;
							到&nbsp;<input type="text"  validation="date" readonly="readonly"  id="toDate" name="toDate"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/>
							&nbsp;&nbsp;
							<a class="button" id="submit"><span>&nbsp;确 定&nbsp;</span> </a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle" >
				    <th colspan="11"><h3>检索结果</h3></th>               
			</tr>
		</thead>
		<tbody id="tbody" style="border-style: solid;border: 1px;">	
		</tbody>
		<tfoot>
			
		</tfoot>
	</table>
	</body>
	<script type="text/javascript">
		 var date = getdate();
		function getdate(){ 
			var now = new Date();
			y = now.getFullYear() ;
			m = now.getMonth()+1;
			d = now.getDate();
			m = m < 10 ? "0"+ m : m;
			d = d < 10 ? "0"+ d : d ;
			return y+ "-"+m+ "-"+d ;
			};
			
		 $("#toDate").val(date);		
	</script>
</html>
