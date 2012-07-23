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
					<h3>成品鹅交易记录列表</h3>
					<div class="tableControllerButton">
						<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/tradeGooseAction!get'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_add.png" align="absmiddle"/>&nbsp;添加</span></a>
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
				<th>
					<h3>每公斤价格</h3>
				</th>
				<th>
					<h3>总重量</h3>
				</th>	
				<th>
					<h3>交易合计(元)</h3>
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
		<form action="${pageContext.request.contextPath }/pages/goose/tradeGooseAction!del" name="myForm" id="myForm" method="post">
			<c:forEach items="${pageController.data}" var="tradeGoose">
				<tr>
					<td width="20px"><input type="checkbox" name="id" value="${tradeGoose.id}"/></td>
					<td>${tradeGoose.tradeDate}</td>
					<td>${tradeGoose.amount}</td>
					<td>${tradeGoose.unitPrice}</td>
					<td>${tradeGoose.totalWeight}</td>
					<td>${tradeGoose.unitPrice * tradeGoose.totalWeight}</td>
					<td>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/tradeGooseAction!get?tradeGoose.id=${tradeGoose.id }'; return false;"><span>修改</span></a>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); deleteOne('${pageContext.request.contextPath }/pages/goose/tradeGooseAction!del?id=${tradeGoose.id }'); return false;"><span>删除</span></a>
					</td>
					<td>${tradeGoose.comments}</td>
				</tr> 
			</c:forEach>
		</form>
		</tbody>
		<tfoot>
			<tr  class="tableController_bottom">
				<td colspan="11" align="center">
					<div class="pageBar">
						<jsp:include page="../../include/SplitPage.jsp">
							<jsp:param name="pager" value="${pageController}"/>
						</jsp:include>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
  </body>
</html>
