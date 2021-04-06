<%@page import="myweb_ex.NoteMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String receiver = (String)session.getAttribute("id");
String content = request.getParameter("content");

System.out.println("content is:\n"+content);
NoteMessage.deleteMessage(receiver, content);
response.sendRedirect("noteMessage.jsp");
%>