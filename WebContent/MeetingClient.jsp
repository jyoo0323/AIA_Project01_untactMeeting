<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WSS_Meeting</title>
</head>
<style>
#pptView {
   position: relative;
   left: 550px;
   display: inline;
}
#txtArea {
   position: absolute;
   display: block;
}
#ppt {
   position: absolute;
   left: 0;
   top: 510px;
   display: inline;
}
#backbtns {
	position: absolute;
	top: 640px;
}
</style>

<body>

<form id="shootMsg">
   <input type="text" size="80" id="msg" autocomplete="off" required/>
   <input type="button" id="send" value="Send"/>
</form>
<textarea name="txtArea" id="txtArea" cols="70" rows="30" style="margin-top: 25px;"></textarea>
<iframe id="pptView" src="Ajax_pptUploadClient.jsp" style="width: 800px; height: 803px; border: hidden; display: inline;"></iframe>
<iframe id="ppt" src="pptUpload.jsp" style="width: 400px; height: 140px; border: hidden;"></iframe>
<br>
<div id="backbtns">
	<input type="button" id="disconnect" value="Disconnect from Meeting"/>
	<form action="interfaceUI.jsp">
	   <input type="submit" value="Back To Interface"/>
	</form>
</div>

<script src="http://code.jquery.com/jquery.js"></script>
<%
String lid = (String)session.getAttribute("id");
%>



<script>
var id = "<%= lid%>";
var socket = new WebSocket("ws://192.168.35.29:8888/AIA_Project01/socketTools/"+id);

socket.onopen = function(event){
   $("#txtArea").append(">>> Open...Connected... \n");
}
socket.onclose = function(event){
   $("#txtArea").append(">>> Disconnected...\n");
}
socket.onmessage = function(event){
   $("#txtArea").append(">>> " +event.data +"\n");
}
socket.onerror = function(event){
   $("#txtArea").append(">>> Error Occured...\n");
}

var enter = function (event) {
   event.preventDefault();
   $("#txtArea").append("나 : "+$("#msg").val() +"\n");
   socket.send(id+" : "+$("#msg").val());
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