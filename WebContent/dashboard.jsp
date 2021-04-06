<%@page import="java.util.Set"%>
<%@page import="myweb_ex.Dashboard"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dash board</title>
<link rel="stylesheet" href="dashboard.css" />
</head>
<body>
<div class="box">
<div class="form_post">

<h3>알림판</h3>
   <form id="thread" action="dashboardInsert.jsp">
      <input class="form_post_text" type="text" size="80" name="txt" autocomplete="off" placeholder="알림내용" required/>
      <input class="form_post_btn" type="submit" id="send" value="Post"/>
   </form>
</div>

<%
HashMap<Integer, String[]> map = Dashboard.getAllContents();

for(int i =map.size()-1; i>0; i--) {
%>
<div class="form_dashboard">
   <form action="dashboardDelete.jsp">
   <div class="form_dashboard_contents">
      <label class="form_dashboard_label"><%=map.get(i)[0] %> -></label>
      <p class="form_dashboard_p"><%=map.get(i)[1] %></p>
      <input type="text" name="content" value="<%=map.get(i)[1] %>" style="display:none;"/>
	  <input type="text" name="writer" value="<%=map.get(i)[0] %>" style="display:none;"/>
      <input class="form_dashboard_btn" type="submit" value="X"/>
   </div>
   </form>
</div>
<%} %>
</div>

</body>
</html>