<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공(판매자)</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<style>
	.tdcss { height:200px; width:300px; text-align:center; color:purple;}
</style>
<body>
		
<h1 class="head"  onclick="location.href='ShopController?command=shopping_main'" title="메인페이지로 이동">ONE MARKET</h1>
<h1 class="box"></h1>
<p>아이디 찾기</p>
<%
	String name = request.getParameter("name");
	String sellerid = (String)request.getAttribute("id");
%>

<div id="wrapper">
	<table>
		<tr>
			<td class="tdcss"> 
			'<b><%=name %></b>'고객님의 <br/>
			아이디 찾기가 완료되었습니다!<br/> <br>
			아이디  <b><%= sellerid %></b>
			</td>
		</tr>
	</table>
</div>	
<p class="line"></p><br/>
<div id="wrapper2">
		<input class="btn" type="submit" value="로그인하기" onclick="location.href='login_page.jsp'"/>
	</div>
</body>
</html>