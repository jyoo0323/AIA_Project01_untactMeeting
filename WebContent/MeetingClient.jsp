<%@page import="org.h2.engine.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WSS_Meeting</title>
</head>
<body>
<form id="shootMsg">
	<input type="text" size="80" id="msg" autocomplete="off" required/>
	<input type="button" id="send" value="Send"/>
</form>
<hr>
<textarea name="txtArea" id="txtArea" cols="100" rows="30"></textarea>
<input type="button" id="disconnect" value="Disconnect from Meeting"/>
<form action="interfaceUI.jsp">
<input type="submit" value="Back To Interface"/>
</form>
<script src="http://code.jquery.com/jquery.js"></script>
<%
String lid = (String)session.getAttribute("id");
%>
<script>
var id = "<%= lid%>";
var socket = new WebSocket("ws://localhost:8888/AIA_Project01/socketTools");

socket.onopen = function(event){
	$("#txtArea").append(">>> Open...Connected... \n");
}
socket.onclose = function(event){
	$("#txtArea").append(">>> Closed...\n");
}
socket.onmessage = function(event){
	$("#txtArea").append(">>> "+ id +event.data +"\n");
	
}
socket.onerror = function(event){
	$("#txtArea").append(">>> Error Occured...\n");
}

var enter = function (event) {
	event.preventDefault();
	$("#txtArea").append("나 : "+$("#msg").val() +"\n");
	socket.send($("#msg").val());
	$("#msg").val("");
}

$("#send").click(enter);

$("#disconnect").click(function(event){
	socket.close();
});

$('#shootMsg').submit(enter);

</script>
</body>
</html>