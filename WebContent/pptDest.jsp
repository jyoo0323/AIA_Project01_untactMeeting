<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="pptDest.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String imgPath = "upload/imgs/";
int numpgs = 9;//Integer.parseInt((String)request.getParameter("numpgs"));
String username = (String)request.getParameter("name");
%>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<script>



$(function(){	
	var imagesAt = "<%=imgPath %>";
	var pgs = <%=numpgs %>
	for(var i = 1; i <= pgs; i++) {
	   $('#list_num').append('<a href="#"><img src="upload/imgs/slide-'+i+'.png" alt="'+i+'" /></a>');
	}
	for(var i = 1; i <= pgs; i++) {
		$('#centerLoc').append('<li><a href=""><img src="'+imagesAt+'/slide-'+i+'.png" alt="block"'+i+'/></a></li>');
	}
	
	var listA = $('#list_num>a'); //list of <a>s in the elt ided as list_num
	var li = $('#banner').find("li");
	var i = 0;
	var playOn = false;
	var roll;
	
	listA.click(function(){
		var index = listA.index(this);
		index = ""+index;
		$.post("pptDestServer.jsp",{ind: index},function(data, status){
			if(status == 'success') {
			}
		});
	});
	
	listA[0].click();
	
	var clientCnt=0;
	var inter = setInterval(function(){
		$.get("pptDestServer.jsp?i="+i,function(data, status){
			if(status == 'success') {
				var jsObj = JSON.parse(data.trim());
				var text = jsObj.info;
				clientCnt = parseInt(text[0].curNum);
				$(li[clientCnt]).show();
				listA.state = this;
				li.state = li[clientCnt];
			}
		});
	},100)
});
</script>
<div id="wrap">
	<h2><%=username %>의 ppt</h2>
	<div id="banner">
		
		<div class="vis_frame">
		
			<ul id="centerLoc">
			</ul>
			
		</div>
		
		<div id="list_num">
		</div>
		
	</div>
	
	<div id="b_bt">
		<a href="#left" class="left">Prev</a>
		<a href="#right" class="right">Next</a>
	</div>
</div>	
</body>
</html>