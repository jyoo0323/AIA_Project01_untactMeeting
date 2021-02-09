<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String lid = (String)session.getAttribute("id");
System.out.println("ID we are currently looking "+lid);
%>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
var socket = new WebSocket("ws://localhost:8888/AIA_Project01/socketTools");

socket.onopen = function(event){
	$("#txtArea").append(">>> Open...Connected... \n");
}
socket.onclose = function(event){
	$("#txtArea").append(">>> Closed...\n");
}
socket.onmessage = function(event){
	$("#txtArea").append("<<< "+ event.data +"\n");
}
socket.onerror = function(event){
	$("#txtArea").append(">>> Error Occured...\n");
}

</script>
</body>
</html>