<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" href="search.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <section class="search-form">
      <h1>Search ID</h1>
      <form action="idSearchHelp.jsp">
         <div class="int-area">
            <input type="text" name="name" id="name" autocomplete="off" placeholder="NAME" />
         </div>
         <div class="int-area">
            <input type="text" name="position" id="position" autocomplete="off" placeholder="POSITION" />
         </div>
         <div class="int-area">
            <input type="text" name="code" id="code" autocomplete="off"   placeholder="CODE" />

         </div>         
         <div class="btn-area">
            <button class="lookupbtn" type="submit">Look UP -></button><br>
            <a href="LoginUI.jsp">Cancel</a><br>
            <br>
         </div>
      </form>
   </section>


</body>
</html>