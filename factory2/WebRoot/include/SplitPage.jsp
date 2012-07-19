<%@ page language="java" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<form action="${pageController.URL}" method="post" name="SplitForm" id="SplitForm">
		<input type="hidden" name="act" value="list" />
		<input type="hidden" name="pageController.currentPage" id="currentPage" value=""/>
		<input type="hidden" name="pageController.pageSize" id="pageSize" value=""/>
		<input type="hidden" name="link.linkTypeId" value="${link.linkTypeId}" />
		<input type="hidden" name = "news.newsTypeId" value ="${news.newsTypeId }"/>
		<input type="hidden" name = "studentPicture.type" value ="${type}"/>
		<input type="hidden" name = "officialPicture.type" value ="${type}"/>
		<div class="pageBar">
			当前${pageController.currentPage}/${pageController.totalPages}页&nbsp;&nbsp; 每页
			<input type="text" name="pz" id="pz" value="${pageController.pageSize}"
				onkeypress="setPageSize(event, this.value);" />
			条&nbsp;&nbsp; 共${pageController.totalRowsAmount}条&nbsp;&nbsp;
			
			<c:if test="${pageController.currentPage!=1}">
				<a href="#" onclick="getList(1)">
					<img src="${pageContext.request.contextPath }/images/main/First.gif" align="absmiddle" /> 
				</a>
				&nbsp;&nbsp;
				<a href="#" onclick="getList(${pageController.previousPage})">
					<img src="${pageContext.request.contextPath }/images/main/Previous.gif" align="absmiddle" /> 
				</a>
				&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${pageController.currentPage==1}">
				<img src="${pageContext.request.contextPath }/images/main/First-disabled.gif" align="absmiddle" />
				&nbsp;&nbsp; 
				<img src="${pageContext.request.contextPath }/images/main/Previous-disabled.gif" align="absmiddle" />
				&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${pageController.currentPage!=pageController.totalPages}">
				<a href="#" onclick="getList(${pageController.nextPage})">
					<img src="${pageContext.request.contextPath }/images/main/Next.gif" align="absmiddle" /> 
				</a>
				&nbsp;&nbsp;
				<a href="#" onclick="getList(${pageController.totalPages})">
					<img src="${pageContext.request.contextPath }/images/main/Last.gif" align="absmiddle" /> 
				</a>
				&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${pageController.currentPage==pageController.totalPages}">
				<img src="${pageContext.request.contextPath }/images/main/Next-disabled.gif" align="absmiddle" />
				&nbsp;&nbsp;
				<img src="${pageContext.request.contextPath }/images/main/Last-disabled.gif" align="absmiddle" /> 
				&nbsp;&nbsp;
			</c:if>
					 
			转到
			<input type="text" name="cp" id="cp"
				value="${pageController.currentPage}"
				onkeypress="setCurrentPage(event, this.value);" />
			页&nbsp;&nbsp;
		</div>
	</form>
<script type="text/javascript">
	function getList(page) {
		document.getElementById("currentPage").value = page;
		document.getElementById("pageSize").value = document.getElementById("pz").value; 
		document.getElementById("SplitForm").submit();
	}
	function setPageSize(event, pageSize) {
		if(event.keyCode == 13){
		document.getElementById("currentPage").value = 1;
		document.getElementById("pageSize").value = pageSize; 
		document.getElementById("SplitForm").submit();
		}
	}
	function setCurrentPage(event, currentPage) {
		if(event.keyCode == 13){
			document.getElementById("currentPage").value = currentPage;
			document.getElementById("pageSize").value = document.getElementById("pz").value;
			document.getElementById("SplitForm").submit();
		}
	}
</script>		