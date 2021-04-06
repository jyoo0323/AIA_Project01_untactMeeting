<%@page import="myweb_ex.NoteMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sender = (String)session.getAttribute("id");
String receiver = request.getParameter("receiver");
String content = request.getParameter("noteMsg");

NoteMessage.sendMessage(sender, receiver, content);
response.sendRedirect("noteMessage.jsp");
%>