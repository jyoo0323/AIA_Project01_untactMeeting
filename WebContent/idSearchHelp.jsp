<%@page import="java.io.PrintWriter"%>
<%@page import="myweb_ex.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String pos = request.getParameter("position");
String code = request.getParameter("code");

System.out.println(name+", "+pos+", "+code);

String id = User.findID(name, pos, code);
if(id != null && !id.equals("")){
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter pw = response.getWriter();
	out.println("<script>alert('찾은 아이디 : "+ id +"');location.href='LoginUI.jsp';</script>");
	out.flush();
}%>
<script>
	alert("존재하지 않는 회원입니다.");
	location.href="idSearch.jsp";
</script>

