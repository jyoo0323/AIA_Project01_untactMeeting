<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
private static int curPic = 1;
%>
<%
if("POST".equals(request.getMethod())) {
	curPic++; 
	if(curPic >= 9){
		curPic = 0;
	}
}else {
	int clientCnt = Integer.parseInt(request.getParameter("clientCnt"));
	if(clientCnt == curPic){
		
	} else {
		String curStr = ""+curPic;
		JSONArray jsArr = new JSONArray();
		JSONObject jsObj = new JSONObject();
		jsObj.put("curNum",curStr);
		jsArr.put(jsObj);
		JSONObject jsRoot = new JSONObject();
		jsRoot.put("info", jsArr);
		out.print(jsRoot);
	}
}
%>