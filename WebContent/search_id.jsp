<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/find_id.css" type="text/css">
<script type="text/javascript" src="js/check_login.js"></script>
</head>
<body>
<h1 class="head"  onclick="location.href='ShopController?command=shopping_main'" title="메인페이지로 이동">ONE MARKET</h1>
<h1 class="box"></h1>
<p>아이디 찾기</p><br/><br/>
<div id="wrapper">
	<% String context = request.getContextPath(); %>
	<form action="<%=context%>/ShopController?command=search_id" method="post" name="frm2">
	<table>
		<tr>
			<td><label for="name">이름</label></td>
			<td><input type="text" id="name" name="name" /></td>
		</tr>			
		<tr>
			<td><label for="phone">연락처</label></td>
			<td><input type="text" id="phone" name="phone" /></td>
		</tr>
		<tr>
			<td><label for="rg_type">가입유형</label></td>
			<td>
				<label><input class="btn1" type="radio" id="buyer" name="radiotype" value="buyer">소비자</label>
				<label><input class="btn1" type="radio" id="seller" name="radiotype" value="seller">판매자</label>
			</td>
		</tr>
	</table>
	<br/><br/>
</div>	
<p class="line"></p><br/>	
	<div id="wrapper2">
		<input class="btn" type="submit" value="확인" onclick="return check_search_id()"/>
	</div>
	</form>

</body>
</html>