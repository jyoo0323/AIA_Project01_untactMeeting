<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath = request.getServletContext().getRealPath("upload");
	//String uploadPath = request.getRealPath("upload");
	//String uploadPath = "upload";
	//"D:\\Desktop\\Classes\\A.I_Academy_projects\\JSP_work\\AIA_Project01\\src\\pptconvert\\asd";

	
	
	int size = 10*1024*1024;
	String name="";
	String filename="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		name = multi.getParameter("name");
		
		Enumeration<?> files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename=multi.getOriginalFileName(file1);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	session.setAttribute("uploader", name);
%>
<html>
<body>
<form name="pptDisplay" action="pptDisplay.jsp" method="post">
	<input type="text" name="name" value="<%=filename%>">
	<input type="text" name="path" value="<%=uploadPath%>">
	<input type="text" name="username" value="<%=name%>">
</form>
<a href="#" onclick="javascript:pptDisplay.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
