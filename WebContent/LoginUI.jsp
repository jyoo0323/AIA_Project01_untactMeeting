<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
</style>
<meta charset="UTF-8">
<title>Untact Office Login</title>
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
}
.login-form{position:relative; z-index:2;}
.login-form h1{
   font-size: 30px;
   text-align: center;
   margin-bottom: 60px;
}
..int-area:first-child{
   margin-top: 0;
}
.int-area {
   width: 400px;
   position: relative;
   margin-top: 20;
}
.int-area input {
   width: 100%;
   padding: 20px 10px 10px;
   background-color: transparent;
   border: none;
   border-bottom: 1px solid #555;
   font-size: 20px; color: #111;
   outline: none;
}
.int-area label {
   position: absolute; left: 10; top: 15px;
   font-size: 20px; color: #111;
   transition: all .5s ease;
}

.int-area input:focus + label,
.int-area input:valid + label{
   top: -2px;
   font-size: 13px;
   color: #ffffff;
   /* 색깔 정하기  */
}
.btn-area {
   margin-top: 30px;
}
.btn-area button {
   width: 100%;
   height: 50px;
   /* background: #e0ffff; */
   color: #111;
   font-size: 20px;
   border: none;
   border-radius: 25px;
   cursor: pointer;
}
.caption {
   margin-top: 20px;
   text-align: center;
}
.caption a {
   font-size: 15px;
   color: #111;
   margin-bottom: 10px;
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
      <h1>Untact Office</h1>
      <form action="loginHelp.jsp">
         <div class="int-area">
         <input type="text" name="id" id="id" autocomplete="off" required/>
         <label for="id">USER NAME</label>
         </div>
         <div class="int-area">
         <input type="password" name="pwd" id="pwd" autocomplete="off" required/>
         <label for="id">PASSWORD</label>
         </div>
         <div class="btn-area">
         <button type="submit">LOGIN</button>
         </div>
         <div class="caption">
         <a href="idSearch.jsp">Forgot ID?</a><br><br>
         <a href="signUp.jsp">Welcomes to SignUp!</a><br>
         </div>
      </form>
   </section>
   
   <script>
   left id = $("#id");
   left pw = $("#pw");
   left btn = $("#btn");
   
   $(btn).on("click", function(){
      if($(id).val() == ""){
         $(id).next("label").addClass("Warning");
      }else if($(pw).val() == ""){
         $(pw).next("label").addClass("Warning");
      }
   });    
   </script>


</body>
</html>