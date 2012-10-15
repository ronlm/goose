<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


<script type="text/javascript" src="../../js/jquery-1.3.2.min.js"></script>
<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
<script type="text/javascript" src="../../js/getInfo.js"></script>

<body  onload="changeRowColor();">
	<table class="mainTable" id="table" >
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>当前页面:鹅只死亡信息统计</h3>
					<div class="tableControllerButton">
						<form name="changeDayForm" id="changeDayForm" action="${pageContext.request.contextPath }/pages/goose/deadGooseStatisticAction!dead" method="post">
							最近
							  <select name="daysSelect" id="daysSelect" style="width:80px;border: solid,1px" onchange="document.getElementById('daysWithin').value=this.value;">  
								  <option value="3" <c:if test="${daysWithin == 3 }">selected="selected"</c:if>>3</option>
								  <option value="7" <c:if test="${daysWithin == 7 }">selected="selected"</c:if>>7</option>
								  <option value="14" <c:if test="${daysWithin == 14 }">selected="selected"</c:if>>14</option>
								  <option value="30" <c:if test="${daysWithin == 30 }">selected="selected"</c:if>>30</option>
								  <option value="60" <c:if test="${daysWithin == 60 }">selected="selected"</c:if>>60</option>
								  <option value="90" <c:if test="${daysWithin == 90 }">selected="selected"</c:if>>90</option>
								  <option value="120" <c:if test="${daysWithin == 120 }">selected="selected"</c:if>>120</option>
								  <option value="365" <c:if test="${daysWithin == 365 }">selected="selected"</c:if>>365</option>
								  <option value="-1"<c:if test="${daysWithin == -1}">selected="selected"</c:if>>全部</option>
							  </select>  
							  天内农场死亡鹅只统计&nbsp;&nbsp;&nbsp;&nbsp;
							  自定义天数:
							  <input type="text" id="daysWithin" name="daysWithin" value="${daysWithin }" style="width:80px;border:border:1px solid #fff000;">  
							天&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="button" id="confirm" onclick="submitForm();"><span>&nbsp;确 定&nbsp;</span></a>
							<a class="button" href="javascript:void(0)" onclick="this.blur(); history.go(-1);return false;"><span><img
								src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span> </a>
						</form>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th width="30px"><h3>序号</h3>
				</th>
				<th><h3>农场</h3>
				</th>
				<th><h3>数量</h3>
				</th>
				<th width="25%"><h3>操作</h3>
				</th>
				<th  width="25%"><h3>备注</h3></th>
		</thead>
		<tbody id="contentBody" style="overflow: auto;height:1200px">
				<c:forEach items="${pager.data}" var="deadInfo" varStatus="status">
					<tr >
						<td>${status.count}</td>
						<td>${deadInfo.farm.name}</td>
						<td>${deadInfo.deadNum}</td>
						<td><a class="button"
							value="${deadInfo.farm.farmerId }" name="farmerId" href="${pageContext.request.contextPath }/pages/goose/deadGooseStatisticAction!deadDetail?farm.id=${deadInfo.farm.id}"><span>存栏明细</span>
						</a><a class="button-small"
							value="${deadInfo.farm.farmerId }" name="farmerId"><span>获取所属农户资料</span>
						</a>
						</td>
						<td>${deadInfo.farm.comments}</td>
					</tr>
				</c:forEach>
		</tbody>
		<tfoot>
			<tr class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pager}" />
						</jsp:include>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
<script type="text/javascript">
function submitForm(){
	if(isNaN(document.getElementById('daysWithin').value)){
		alert("只能输入为1-3位的数字,若出错则返回上页重新输入！");
		document.getElementById('daysWithin').focus();
		return false;
	}
	else{
		if(document.getElementById('daysWithin').value > 365){
			alert("请输入小于365的数字！");
			document.getElementById('daysWithin').focus();
			return false;
		}
		else $("#changeDayForm").submit();
	}
	return false;
}
</script>

</html>
