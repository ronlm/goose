/* 与页面的 获取农户农场信息 按钮绑定，异步获得相应信息
 * */
$(function(){
	
	
	$("a.button-small").click(function(){
		var buttonObj = $(this);
		var Id = buttonObj.attr("value");;
		var url = "/Goose/pages/goose/getInfo.jsp";
		if(buttonObj.attr("name") == "farmerId"){
			url = url + "?infoType=farmerInfo&&farmerId=" + Id;
		}else{	
			url = url + "?infoType=farmInfo&&farmId=" + Id;
		}
		
		$.post(url,function(response){
			buttonObj.hide();
			buttonObj.parent().append(response);
		});
	});
});
