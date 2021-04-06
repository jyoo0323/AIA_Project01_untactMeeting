<%@page import="javax.swing.ImageIcon"%>
<%@page import="pptconvert.PPT2PNG"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.Image"%>
<%@page import="java.util.List"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
private static List<Image> imgs = new ArrayList<Image>();
private static int pgnums = 9;

private static int curPos = 0;

%>
<%
for(int i = 1; i<=pgnums; i++){
	imgs.add(new ImageIcon("upload/imgs/slide-"+i+".png").getImage());
}
%>
<%
out.print(imgs.get(0));
%>

<img src="<%=imgs.get(0) %>" alt="plzzzzzzzz" />