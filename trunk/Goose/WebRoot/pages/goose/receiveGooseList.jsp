<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
  <body style="overflow-y: visible;" onload="changeRowColor();">
    	<table class="mainTable">
		<thead>
			<tr class="tableController">
				<th colspan="8">
					<h3>鹅苗交付信息列表</h3>
					<div class="tableControllerButton">
						查看最近 <input type="text" name="daysWithin" id="daysWithin" width="20px"> 天内交付信息
						<a class="button" href="javascript:void(0)" onclick="this.blur(); history.go(-1);return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"	align="absmiddle" />&nbsp;返回上一页</span></a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th>
					<h3><input type="checkbox" onclick="selectAll(this);"/></h3>
				</th>
				<th>
					<h3>日期</h3>
				</th>
				<th>
					<h3>数量</h3>
				</th>		
				<th width="20%">
					<h3>操作</h3>
				</th>   
				<th width="30%">
					<h3 >备注</h3>
				</th>                        
			</tr>
		</thead>
		<tbody>
		<form action="${pageContext.request.contextPath }/pages/goose/receiveGooseAction!del" name="myForm" id="myForm" method="post">
			<c:forEach items="${pager.data}" var="receiveGoose">
				<tr>
					<td width="20px"><input type="checkbox" name="id" value="${receiveGoose.id}"/></td>
					<td>${receiveGoose.receiveDate}</td>
					<td>${receiveGoose.amount}</td>
					<td>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/receiveGooseAction!get?receiveGoose.id=${receiveGoose.id }'; return false;"><span>修改</span></a>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); deleteOne('${pageContext.request.contextPath }/pages/goose/receiveGooseAction!del?id=${receiveGoose.id }'); return false;"><span>删除</span></a>
					</td>
					<td>${receiveGoose.comments}</td>
				</tr> 
			</c:forEach>
		</form>
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
