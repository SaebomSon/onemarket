<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
<script type="text/javascript" src="js/check_login.js">alert(msg);</script>

</head>
<body>

<h1 class="head" onclick="location.href='ShopController?command=shopping_main'" title="메인페이지로 이동">ONE MARKET</h1>
<h1 class="box"></h1>
<p>로그인 페이지</p><br/><br/>
   <% String msg = (String)request.getAttribute("f_msg"); 
   System.out.println("msg : " + msg);
   %>
   <% if(msg != null){ %>
   <script>
      alert("<%=msg%>");

      
      
   </script>
   <% } %>
   <% String context = request.getContextPath(); %>
   <form action="<%=context%>/ShopController?command=shopping_login" method="post" name="frm2">
   <div id="wrapper">
      <table>
         <tr>
            <td><label for ="id">아이디</label></td>
            <td><input type="text" id="id" name="id" /></td>
         </tr>         
         <tr>
            <td><label for ="pw">비밀번호</label></td>
            <td><input type="password" id="pw" name="pw" /><br/><br/></td>
         </tr>
      </table>
      <br/><br/>
   </div>   
   <p class="line"></p>
   <p class="findId" onclick="location.href='search_id.jsp'">아이디찾기</p>
   <div id="wrapper2">

      <input id="btnSubmit" class="btn" type="submit" value="로그인" onclick="return check_login()" />
      <input class="btn" type="button" value="회원가입" onclick="location.href='choose_register.jsp'"/>
   </div>
   </form>
   
 
 
</body>
</html>