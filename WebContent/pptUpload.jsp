<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>FileUpload Form</title>
</head>
<body>
<section id = "uploadFormArea">
<form action="pptUploadHelp.jsp" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td colspan="2">파일 업로드 폼</td>
	<tr>
		<td><label for = "name">올린 사람 : </label></td><td><input type="text" name="name" id = "name"></td>
	</tr>
	<tr>
		<td><label for = "fileName">파일명 : </label></td><td><input type="file" name="fileName" id = "fileName"></td>
	</tr>
	<tr>
		<td colspan=2 align=center><input type="submit" value="전송"></td>
	</tr>
</table>
</form>
</section>
</body>
</html>
