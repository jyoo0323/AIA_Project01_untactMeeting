<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<script src="http://code.jquery.com/jquery.js"></script>

<script>
function change(text) {
		for(var i =0; i<text.length; i++) {
			var num = text[i].curNum;
			document.getElementById('area').innerHTML = num;
		}
	}

$(function() {
/* 	$.get("Ajax_server.jsp", function(data, status) {
		if(status == "success") {
			predata = data.trim();
			var jsObj = JSON.parse(data.trim());
			var text = jsObj.info;
			change(text);
		}
	}); */

	var clientCnt=0;
	var inter = setInterval(function(){
		$.get("Ajax_server.jsp?clientCnt="+clientCnt,function(data, status){
			if(status == 'success') {
				var jsObj = JSON.parse(data.trim());
				var text = jsObj.info;
				clientCnt = parseInt(text[0].curNum);
				change(text);
			}
		});
	},100)
	
	$('#btn').click(function() {
		$.post("Ajax_server.jsp",function(data, status){
			if(status == 'success') {
				var jsObj = JSON.parse(data.trim());
				var text = jsObj.info;
				change(text);
			}
		});
	});
	
	$('#imgBtn').click(function(){
		$('#list_num').empty();
		$('#list_num').append('<a href="#"><img src="upload/imgs/slide-'+(clientCnt+1)+'.png" alt="" /></a>');
	});
});
</script>
<h2>Ajax Practice</h2>
<div id="wrap">
	<textarea id="area"></textarea>	
	<input id="btn" type="button" value="Increase" />
	<input id="imgBtn" type="button" value="이미지" />
</div>	

<div id="list_num">
<!-- 	<a href="#"><img src="upload/imgs/slide-1.png" alt="" /></a> -->
</div>
</body>
</html>