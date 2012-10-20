/* 与页面的 获取农户农场信息 按钮绑定，异步获得相应信息
 * */
$(function(){
	
	$("a.button-small").click(function(){
		var buttonObj = $(this);
		var Id = buttonObj.attr("value");;
		var url = "/Goose/pages/goose/getInfo.jsp";
		var messageType = buttonObj.attr("name");
		if(messageType == "farmerId"){
			// 请求获得农户和农场信息
			url = url + "?infoType=farmerInfo&&Id=" + Id;
		}else if(messageType == "farmId"){	
			// 请求获得农户信息
			url = url + "?infoType=farmInfo&&Id=" + Id;
		}else if(messageType == "retailerId"){
			//请求获得鹅只销售商信息
			url = url + "?infoType=retailerInfo&&Id=" + Id;
		}
		
		
		$.post(url,function(response){
			buttonObj.hide();
			buttonObj.parent().append(response);
		});
	});
	
	
});
