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
if(session.getAttribute("id") == null){
%>
<script>
alert("로그인이 필요한 기능입니다.");
location.href="LoginUI.jsp";
</script>
<%
} else {
	String id = (String)session.getAttribute("id");
%>
<%=id %> have logged in successfully!
<% } %>
<form action="MeetingClient.jsp">
<input type="submit" value="Meeting Room">
</form>
<form action="logOut.jsp">
<input type="submit" value="log out" />
</form>

</body>
</html>