<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="myweb_ex.SignUp"%>
<%@page import="myweb_ex.UserDao"%>
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
String name = request.getParameter("name");
String position = request.getParameter("position");
String id = request.getParameter("id");
String password = request.getParameter("password");
String code = request.getParameter("code");
String gender = request.getParameter("gender");

SignUp su = new SignUp(id, password, name, position, code, gender);
boolean abc = UserDao.insert(su);
System.out.println(abc);
if(abc) { 
%>
   <script>
   alert("회원가입 성공");
   location.href="LoginUI.jsp";
   </script>
<% } %>
<script>
   alert("회원가입 실패!");
   </script>

</body>
</html>