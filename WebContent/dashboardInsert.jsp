<%@page import="myweb_ex.Dashboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String)session.getAttribute("id");
String content = request.getParameter("txt");

Dashboard.insertPost(name, content);
response.sendRedirect("dashboard.jsp");
%>