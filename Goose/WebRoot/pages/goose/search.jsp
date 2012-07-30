<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="java.text.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="overflow-y: visible;">
	<jsp:include page="../../include/IncludeMain.jsp"></jsp:include>
	
	<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	<body style="overflow-y: visible !important; overflow-y: scroll;">
		<table class="mainTable">
			<thead>
				<tr class="tableController">
					<th colspan="2">
						<h3>
							信息搜索  搜索类别：
							<select name="searchType">
									<option value="farmer">农户与农场信息</option>
									<option value="farm">物资采购与销售信息</option>
									<option value="farm">物资信息</option>
							</select>
						</h3>
					</th>
				</tr>
				<tr>
					<th class="InstructionInfo" colspan="2" >
						按农户姓名搜索：<input type="text" id="farmerName">&nbsp&nbsp&nbsp
						按电话号码搜索：<input type="text" id="farmerName">&nbsp&nbsp&nbsp
						按状态搜索：<select name="cars">
									<option value="signed">已签约</option>
									<option value="notSigned">未签约</option>
									</select>&nbsp&nbsp&nbsp
						<a class="button" href="javascript:void(0)" onclick="this.blur(); window.location='${pageContext.request.contextPath }/pages/goose/farmerAction!get'; return false;"><span><img src="${pageContext.request.contextPath }/js/kui/icons/application_add.png" align="absmiddle"/>&nbsp;搜索</span></a>
					</th>
				</tr>
			</thead>
			
		</table>
		
	</body>
</html>
