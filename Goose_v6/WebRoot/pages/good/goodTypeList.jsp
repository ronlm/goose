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
					<h3>物资分类列表</h3>
					<div class="tableControllerButton">
						<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/good/goodTypeAction!get'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_add.png" align="absmiddle"/>&nbsp;添加</span></a>
						<a class="button" href="javascript:void(0)" onclick="this.blur(); history.go(-1);return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/anticlockwise.png"
								align="absmiddle" />&nbsp;返回上一页</span>
						</a>
					</div>
				</th>
			</tr>
			<tr class="tableTitle">
				<th>
					<h3>序号</h3>
				</th>
				<th>
					<h3>类别名</h3>
				</th>		
				<th width="20%">
					<h3>操作</h3>
				</th>   
				                        
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pager.data}" var="goodType" varStatus="status">
				<tr>
					<td width="20px">${status.count }</td>
					<td>${goodType.name}</td>
					<td>
						<a class="button-small" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/good/goodTypeAction!get?goodType.id=${goodType.id }'; return false;"><span>修改</span></a>
					</td>
				</tr> 
			</c:forEach>
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
