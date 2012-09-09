<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<body style="overflow-y: visible;" onload="changeRowColor();">
	<table class="mainTable" id="table">
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>鹅只销售信息统计</h3>
						<div class="tableControllerButton">
						销售时间:从&nbsp;&nbsp;
							<input type="text"  validation="date" readonly="readonly" id="fromDate" name="fromDate" value="${fromDate }" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/> 
							到&nbsp;&nbsp;<input type="text"  validation="date" readonly="readonly"  id="toDate" name="toDate" value="${toDate }"onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',lang:'zh-cn'})" class="Wdate" style="width:126px"/>
							&nbsp;&nbsp;
						<a class="button" id="showAllRegion" >
							<span><img src="${pageContext.request.contextPath }/js/kui/icons/application_get.png" align="absmiddle"/>&nbsp;查看各个分区销售情况</span>
						</a>
						查看
						<select name="regionId" id="showSingleRegion" style="width: 150px" onchange="showSingleRegion()">
							<option value="0">无</option>
							<c:forEach items="${saleRegionList}" var="saleRegion">
								<option value="${saleRegion.id}">${saleRegion.region}</option>
							</c:forEach>
						</select>
						区销售情况
						<a class="button" href="javascript:void(0)"
							onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span>
						</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3></th>
				<th><h3>名称</h3></th>
				<th><h3>销售总数量(只)</h3></th>
				<th><h3>销售总重量(KG)</h3></th>
				<th><h3>销售总金额(元)</h3></th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
		<tfoot >
			
		</tfoot>
	</table>
</body>
<script type="text/javascript">
	function changeDay(){
			$("#changeDayForm").submit();
	}
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
	
	//点击了查看所以分区的销售情况
	$("#showAllRegion").click(function(){
		var url = "/Goose/servlet/SaleStatisticServlet?fromDate="+ $("#fromDate").val()+"&&toDate=" + $("#toDate").val()+ "&&type=all" ;
		 $.post(url,function(response){
				$("#tbody").html(response);
		});
	});
	
	function showSingleRegion(){
		//查看一个分区内所有销售商的销售统计
		var url = "/Goose/servlet/SaleStatisticServlet?fromDate="+ $("#fromDate").val()+"&&toDate=" + $("#toDate").val()+ "&&type="
		 + "single&&regionId=" + $("#showSingleRegion").val();
		$.post(url,function(response){
			$("#tbody").html(response);
		});
	}
	
</script>

</html>
