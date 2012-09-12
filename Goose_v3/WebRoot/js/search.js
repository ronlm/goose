/*
 * 这是为养鹅而做的记录检索功能而写的，使用jquey完成ajax的请求 
 */
$(function(){
	
	  $("#numEditDiv").hide();
	 
	  /*提交数据
	   * */
	  $("#submit").click(function(){
  
		  var searchType = $("input:radio[name='searchType']:checked").val();
		  var url = "/Goose/servlet/SearchResultServlet?searchType=" + searchType;
		  var fromNum = $("#fromNum").val();
		  var toNum = $("#toNum").val();
		  if(fromNum != "不限" && toNum != "不限"){
			  url = url + "&&fromNum=" + fromNum + "&&toNum=" + toNum;
		  }
		  var fromDate = $("#fromDate").val();
		  var toDate = $("#toDate").val();
		  
		  url = url + "&&fromDate=" + fromDate + "&&toDate=" + toDate;

		  $.post(url,function(response){
				$("#tbody").html(response);
			});
	  });
	  
	  	  
	  /*展示数量输入功能
	   * */
	  $("#numberEdit").click(function(){
		  $(this).hide();
		  $("#numEditDiv").show();
		 
	  });
	  
	  /*格式输入要求
	   * */
	  $("input[validation='number']").change(function(){
		 var result =  /^[-+]?[1-9]\d*$|^0$/.test($(this).val());
		 if(!result){
			
			 $("#numberEdit").show();
			 $("#numEditDiv").hide();
		 }
	  });
});