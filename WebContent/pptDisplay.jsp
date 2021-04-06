<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="pptconvert.PPT2PNG"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getParameter("path");
String name = request.getParameter("name");


String uploader = (String)session.getAttribute("id");
PPT2PNG.pptxConvert(name, path);
String numpgs = Integer.toString(PPT2PNG.getNumpgs()); 
session.setAttribute("pgnum", numpgs);
application.setAttribute("uploader", uploader);
String username = request.getParameter("username");
%>  


<!DOCTYPE html>
<html>
<head>
<%if(session.getAttribute("pgnum") != null) {%>
<script>
top.location.reload(true);
</script>
<% } %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<img src = "upload/imgs/slide-1.png" alt="sadqwesa"/>

<form name="pptDest" action="pptDest.jsp" method="post">
	<input type="text" name="name" value="<%=username%>">
	<input type="text" name="numpgs" value="<%=numpgs%>">
</form>
<a href="#" onclick="javascript:pptDest.submit()">GOooooo</a>
<a href="Ajax_client.jsp">Ajax Practice</a>

</body>
</html>