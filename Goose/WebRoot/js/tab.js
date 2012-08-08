var timoutid;
$(document).ready(function(){
	var url = $("#pageContext").val() + "gooseStatisticAction!";
	
	
	//在整个页面装入完成后，标签效果2的内容区域需要装入静态的html页面内容
	$("#realcontent").load("TabLoad.html");
	//找到标签2效果对应的三个标签，注册鼠标点击事件
	$("#tab li").each(function(index){
		$(this).click(function(){
			$("#tab li.tabin").removeClass("tabin");
			$(this).addClass("tabin");
			if (index == 0) {
				url = url + "getAppearMarket";
				//装入静态完成页面
				//$("#realcontent").load("TabLoad.html");
				$("#realcontent").post(url,function(response){
					$("#content").html(response);//显示鹅只上市信息
				})
			} else if (index == 1) {
				//装入动态部分页面
				$("#realcontent").load("TabLoad.jsp h2");
			} else if (index == 2) {
				//装入远程数据（这里也是一个动态页面输出的数据）
				$("#realcontent").load("TabData.jsp")
			}
		});
	});
	//对于loading图片绑定ajax请求开始和交互结束的事件
	$("#content img").bind("ajaxStart",function(){
		//把div里面的内容清空
		$("#realcontent").html("");
		//整个页面中任意ajax交互开始前，function中的内容会被执行
		$(this).show();
	}).bind("ajaxStop",function(){
		//整个页面中任意ajax交互结束后，function中的内容会被执行	
		$(this).slideUp("1000");
	});
});
