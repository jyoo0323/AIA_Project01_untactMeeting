<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="myweb_ex.User"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
</style>
<meta charset="UTF-8">
<title>Document</title>
<script src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	window.history.forward();
	function noBack(){
		window.history.forward();
	}
</script>

<style>
*{
   margin: 0; padding: 0; box-sizeing: border-box;
}
body{
   font-family: 'Jua', sans-serif;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
   background: url('relax.png') no-repeat center;
}

</style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<%
	if(session.getAttribute("id") != null){
	%>
	<script>
	alert("이미 로그인 하셨습니다!!");
	location.href="interfaceUI.jsp";
	</script>
	<% } %>

   <section class="login-form">
      <h1>프로젝트</h1>
      <form action="loginHelp.jsp">
         <div class="int-area">
         <input type="text" name="id" id="id" autocomplete="off" required/>
         <label for="id">USER NAME</label>
         </div>
         <div class="int-area">
         <input type="password" name="pwd" id="id" autocomplete="off" required/>
         <label for="id">PASSWORD</label>
         </div>
         <div class="btn-area">
         <input type="submit" value="Log in"/>
         </form>
         <a href="signUp.jsp" type="button">Sign Up</a>
         </div>
         <div class="caption">
         <a href="idSearch.jsp">Forgot PassWord?</a>
         </div>
      
   </section>
</body>
</html>