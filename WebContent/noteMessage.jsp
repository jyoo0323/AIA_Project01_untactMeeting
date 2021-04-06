<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="myweb_ex.User"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="myweb_ex.NoteMessage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="noteMessage.css" />
<title>Insert title here</title>

<%
String id = (String)session.getAttribute("id");
List<String[]> ls = NoteMessage.getAllMessages(id);
Set<String> senders = new HashSet<String>();

for(int i =0; i<ls.size(); i++){
   if(!senders.contains(ls.get(i)[0])){
      senders.add(ls.get(i)[0]);
   }
}


List<String> users = User.getAllUsers();
StringBuffer jsArr = new StringBuffer("[");
for(String user: users){
   //System.out.println(user);
   jsArr.append("'"+user+"'");
   jsArr.append(",");
}
String newJsArr = jsArr.substring(0, jsArr.lastIndexOf(","));
newJsArr += "]";

Map<String, String> map = new HashMap<>();
List<Map<String, String>> lsMap = new ArrayList<Map<String, String>>();

for(int i =0;i<users.size();i++){
   map.put(""+i, users.get(i));
   lsMap.add(map);
}

JSONArray jarr = new JSONArray(lsMap);
%>
<script src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
<div class="messagepage_wrapper">
   <h2>My Message Box</h2>
   <script>
   $(function(){
      console.log($("#category") );
      var userArr = eval("<%=newJsArr%>"); 
      for(user of userArr) {
         $('#category').append('<option value="'+user+'">'+user+'</option>');
      }
   });
   </script>
   <div class="message_send">
      <label for="" class="message_send_header">쪽지 쓰기</label>
      <form class="message_send_form" action="sendMessage.jsp">
         <select class="message_send_combobox" id="category" name="receiver"></select>
         <textarea class="message_send_txt" name="noteMsg" cols="30" rows="10"></textarea>
         <input class="message_send_btn" id="sendBtn" type="submit" value="보내기"/>
      </form>
   </div>
   
   <div class="messagebox_big_wrapper">
   <input class="messagebox_checkbox" type="checkbox" id="answer"/>
   <label class="messagebox_header" for="answer">쪽지함</label>
   <div class="dropdown">
   <%
   for(String st: senders){
      %>
      <div class="messagebox_wrapper">
      <div class="messagebox_box" id="outer">
      <label class="messagebox_from" for="">보낸 사람 : <%=st %></label><br>   
      
      <%
      for(int i =0;i<ls.size();i++){
         %>
         
         <% 
         if(ls.get(i)[0].equals(st)){
         %>      
         <div class="messagebox_content" id="inner">
            <label class="messagebox_content_label" for="">내용 :</label>
            <form class="messagebox_content_form" action="deleteNote.jsp">   
            <%=ls.get(i)[1] %>
            <input class="messagebox_text" type="hidden" name="content" value="<%=ls.get(i)[1] %>"/>
            <input class="messagebox_btn" type="submit" value="X"/>
            </form>
         </div>
         <%
         }
      }%>
      </div>
      </div>
      <%
   }
   %>
   </div>
</div>
</div>
</body>
</html>