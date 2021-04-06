<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="myweb_ex.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String name = request.getParameter("id");
String pwd = request.getParameter("pwd");

boolean login = User.login(name, pwd);

String posName = User.getNameAndPos(name);

if(login) {
	session.setAttribute("id", posName);
	response.sendRedirect("interfaceUI.jsp");
}
%>

<script>
alert("로그인 실패");
location.href="LoginUI.jsp";
</script>

</body>
</html>