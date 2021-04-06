<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
</style>
<style>
body {
   font-family: 'Jua', sans-serif;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
}

.join-form {
   position: relative;
   z-index: 2;
}

.join-form h1 {
   font-size: 30px;
   text-align: center;
   margin-bottom: 60px;
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
   border-bottom: 2px solid #555;
   font-size: 20px;
   color: #111;
   outline: none;
}

.form-group {
   margin-top: 30px;
}

.btn-group {
   width: 100%;
   height: 50px;
   /* background: #e0ffff; */
   color: #111;
   font-size: 20px;
   border: none;
   border-radius: 25px;
}

.btn-area {
   font-size: 30px;
   margin-top: 30px;
   text-align: right;
}
.gobtn {
   font-size: 30px;
   border: 1px solid white;
   border-radius: 15px;
   background-color: white;
   margin-bottom: 10px;
   cursor: pointer;
   font-family: 'Jua', sans-serif;
}

a { text-decoration: none; color: black; }
a:visited { text-decoration: none; }
a:hover { text-decoration: none; }
a:focus { text-decoration: none; }
a:hover, a:active { text-decoration: none; }

</style>


<meta charset="UTF-8">
<title>Untact Office SignUp</title>
</head>
<body>
   <section class="join-form">
      <h1>SIGN UP</h1>
      <form action="signUphelp.jsp">
         <div class="int-area">
            <input type="text" name="name" id="name" autocomplete="off" placeholder="NAME" />
         </div>
         <div class="int-area">
            <input type="text" name="position" id="position" autocomplete="off" placeholder="POSITION" />
         </div>
         <div class="int-area">
            <input type="text" name="id" id="id" autocomplete="off" placeholder="ID" />
         </div>
         <div class="int-area">
            <input type="password" name="password" id="password" autocomplete="off" placeholder="PASSWORD" />
         </div>
         <div class="int-area">
            <input type="text" name="code" id="code" autocomplete="off"   placeholder="CODE" />

         </div>
         <div class="form-group">
            <div class="btn-group" style="text-align: center">
               <input type="radio" name="gender" id="gender" autocomplete="off" value="Male"/>MEN
               <input type="radio" name="gender" id="gender" autocomplete="off" value="Female"/>WOMEN
            </div>
         </div>
         
         <div class="btn-area">
            <button class="gobtn" type="submit">GO!</button><br>
            <a href="LoginUI.jsp">Cancel</a><br>
            <br>
         </div>
      </form>
   </section>


</body>
</html>