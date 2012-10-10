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
				<th colspan="7">
					<c:if test="${farmer.name!=null }">
						<h3>${farmer.name}的农场信息列表</h3>
					</c:if>
					<c:if test="${farmer.name==null }">
						<h3>全部农场信息列表</h3>
					</c:if>
					<div class="tableControllerButton">
						<c:if test="${farmer.name!=null }">
							<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/farmerFarm/farmAction!add?farmer.id=${farmer.id }'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_add.png" align="absmiddle"/>&nbsp;添加</span></a>
						</c:if>
							<a class="button" href="javascript:void(0)" onclick="this.blur(); history.go(-1);return false;"><span><imgsrc="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png" align="absmiddle" />&nbsp;返回上一页</span>
							</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th width="30px">
					<h3>序号</h3>
				</th>
				<th>
					<h3>农场名</h3>
				</th>
				<th>
					<h3>地址</h3>
				</th>
				<th>
					<h3>占地面积</h3>
				</th>
				<th>
					<h3>签约日期</h3>
				</th>
				<th width="30%">
					<h3>操作</h3>
				</th>   
				<th width="30%">
					<h3 >备注</h3>
				</th>                        
			</tr>
		</thead>
		<tbody>
		<form action="${pageContext.request.contextPath }/pages/farmerFarm/farmAction!del" name="myForm" id="myForm" method="post">
			<c:forEach items="${pager.data}" var="farm" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${farm.name}</td>
					<td>${farm.address}</td>
					<td>${farm.area}</td>
					<td>${farm.signDate}</td>
					<td>
						<c:if test="${farm.signDate != null }" >
							<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/receiveGooseAction!list?farm.id=${farm.id }'; return false;"><span>查看接收鹅苗记录</span></a>
							<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/tradeGooseAction!list?farm.id=${farm.id }'; return false;"><span>查看交易成品鹅记录</span></a>
						</c:if>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/farmerFarm/farmAction!get?farm.id=${farm.id }'; return false;"><span>修改</span></a>
					</td>
					<td>${farm.comments}</td>
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
