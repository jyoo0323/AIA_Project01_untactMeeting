<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
private static int curPic = 1;
private static JSONObject jsRoot = new JSONObject();
%>
<%

String uploader = (String)application.getAttribute("uploader");

String maxPg = (String)application.getAttribute("pgid");

if(maxPg != null){
	if("POST".equals(request.getMethod())) {
		String type = (String)request.getParameter("type");
		if(type.equals("Decrease")){
			curPic--;
		}else {
			curPic++;
		}
		if(curPic > Integer.parseInt(maxPg)){
			curPic = 1;
		}
		if(curPic <= 0){
			curPic = Integer.parseInt(maxPg);
		}
	} else {
		String curStr = ""+curPic;
		int clientCnt = Integer.parseInt(request.getParameter("clientCnt"));
		if(clientCnt == curPic) {
			out.print(jsRoot);
		} else {
			String statement = "<a href="+'"'+"#"+'"'+"><img src="+'"'+"upload/imgs/slide-"+curStr+".png"+'"'+" alt="+'"'+'"'+" /></a>";
			JSONArray jsArr = new JSONArray();
			JSONObject jsObj = new JSONObject();
			jsObj.put("curNum",curStr);
			jsObj.put("curAdd", statement);
			jsObj.put("uploader", uploader);
			jsArr.put(jsObj);
			jsRoot = new JSONObject();
			jsRoot.put("info", jsArr);
			out.print(jsRoot);
		}
	}
}
%>