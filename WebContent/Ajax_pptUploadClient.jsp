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
<%!
public String pgid = null;
public String uploader = null;
%>
<%
pgid = (String)session.getAttribute("pgnum");
application.setAttribute("pgid", pgid);
%>
<script>
var presenter = "<%=uploader %>";
var ready = false;

$(function() {
	var ready = false;

	var clientCnt = 1;
	
	var inter = setInterval(function(){
		if(ready){
			$.get("Ajax_pptUploadServer.jsp?clientCnt="+clientCnt, function(data, status){
				if(status == 'success') {
					var jsObj = JSON.parse(data.trim());
					var text = jsObj.info;
					clientCnt = parseInt(text[0].curNum);
					$('#list_num').empty();
					$('#list_num').append(text[0].curAdd);
					$('#header').empty();
					$('#header').append(text[0].uploader+" 님의 PPT");
					}
				});
		}
	},100);
	
	
	$('#btnInc').click(function() {
		$('#list_num').empty();
		$.post("Ajax_pptUploadServer.jsp",{type: "Increase"},function(data, status){
			if(status == 'success') {
			}
		});
	});
	$('#btnDec').click(function() {
		$('#list_num').empty();
		$.post("Ajax_pptUploadServer.jsp",{type: "Decrease"},function(data, status){
			if(status == 'success') {
			}
		});
	});
	
	$('#imgBtn').click(function(){
		ready = true;
		$('#list_num').empty();
		$('#list_num').append('<a href="#"><img src="upload/imgs/slide-'+(clientCnt)+'.png" alt="" /></a>');
	}); 
});
</script>
<h2 id="header">PPT Area</h2>

<div id="wrap">
<!-- 	<textarea id="area"></textarea>	
	<textarea id="aarea"></textarea>	 -->
	
	<input id="btnInc" type="button" value="Increase" />
	<input id="btnDec" type="button" value="Decrease" />
	
	<input id="imgBtn" type="button" value="이미지"/>
</div>	

<div id="list_num">
 	<a href="#"><img src="upload/imgs/ready.png" alt="" /></a>
</div>
</body>
</html>