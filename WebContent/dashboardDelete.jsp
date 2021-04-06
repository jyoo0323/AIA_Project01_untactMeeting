<%@page import="myweb_ex.Dashboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String content = request.getParameter("content");

String user = (String)session.getAttribute("id");
String writer = request.getParameter("writer");

System.out.println(user +", "+ writer);

if(writer.equals(user)){
	Dashboard.deletePost(user, content);
	response.sendRedirect("dashboard.jsp");
}
%>
<script>
alert("작성자가 아닙니다! 삭제불가")
location.href="dashboard.jsp";
</script>