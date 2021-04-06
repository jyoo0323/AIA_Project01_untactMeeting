<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Untact Office Main</title>
<meta charset="UTF-8">
    <title>Side Menu Bar</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/9caba9c819.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
var dashPushed = 0;
var notePushed = 0;

function loadDash(){
   if(dashPushed%2 == 0 || document.getElementById('board').style.display=='none'){
      dashPushed++;
      deload();
      document.getElementById('board').style.display='inline';
   } else {
      dashPushed = 0;
      deload();
   }   
}
function deload(){
   document.getElementById('board').style.display='none';
   document.getElementById('note').style.display='none';
}
function loadNote(){
   if(notePushed%2 == 0 || document.getElementById('note').style.display=='none'){
      notePushed++;
      deload();
      document.getElementById('note').style.display='inline';
   } else {
      notePushed = 0;
      deload();
   }
}
</script>
</head>
<body>
<%
if(session.getAttribute("id") == null){
%>
<script>
alert("로그인이 필요한 기능입니다.");
location.href="LoginUI.jsp";
</script>
<%
} else {
   String id = (String)session.getAttribute("id");
}%>
<input type="checkbox" id="check" />
    <label for="check">
        <i class="fas fa-bars" id="btn"></i>
        <i class="fas fa-times" id="cancel" onclick="deload()"></i>
    </label>
    <div class="sidebar">
        <header>My Page</header>
        <ul>
        <li><a href="#" id="dashboardBtn" onclick="loadDash()"><i class="fas fa-qrcode"></i>Dash board</a></li>
        <li><a href="#" id="noteBtn" onclick="loadNote()"><i class="far fa-envelope"></i>Message</a></li>
        <li><a href="MeetingClient.jsp"><i class="fas fa-link"></i>Meeting</a></li>
        <li><a href="logOut.jsp"><i class="fas fa-sign-out-alt"></i>LogOut</a></li>
    </ul>
    </div>
 <iframe id="note" src="noteMessage.jsp" style="margin-left: 255px; margin-top: 75px; width: 1250px; height: 750px; display: none; border: none;"></iframe>
 <iframe id="board" src="dashboard.jsp" style="margin-left: 255px; margin-top: 75px; width: 1250px; height: 750px; display: none; border: none;"></iframe>
</body>
</html>