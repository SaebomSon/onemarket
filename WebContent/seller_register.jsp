<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 회원가입</title>

<link rel="stylesheet" href="css/seller_register.css" type="text/css">
<script type="text/javascript" src="js/check_form.js"></script>
</head>
<body>

<h1 class="head" onclick="location.href='ShopController?command=shopping_main'" title="메인페이지로 이동">ONE MARKET</h1>
<h1 class="box"></h1>
<p>판매자 회원가입</p><br/>

	<% String context = request.getContextPath(); %>
	<form action="<%=context%>/ShopController?command=shopping_registerSeller" method="post" name="frm1">
		<div id="wrapper">
			<table>
				<tr>
					<td><label for ="id">아이디</label></td>
					<td><input type="text" id="id" name="id" /></td>
					<td><input class="btn" type="button" value="아이디 중복확인" onclick="open_id_check()"/><br/>
						<input type="hidden" id="id_duplicate"/>
					</td>
				</tr>			
				<tr>
					<td><label for ="pw">비밀번호</label></td>
					<td colspan="2"><input type="password" id="pw" name="pw" /><br/><br/></td>
				</tr>
				<tr>
					<td><label for ="pw">비밀번호확인</label></td>
					<td colspan="2"><input type="password" id="pw_ck" name="pw_ck"/><br/><br/>	</td>
				</tr>
				<tr>
					<td><label for ="name">이름</label></td>
					<td colspan="2"><input type="text" id="name" name="name"/><br/>	<br/>	</td>
				</tr>
				<tr>
					<td><label for ="phone">연락처</label></td>
					<td colspan="2"><input type="text" id="phone" name="phone" placeholder="예) '-'없이 숫자만 입력"/><br/><br/></td>
				</tr>
				<tr>
					<td><label for="products">판매물품</label></td>
					<td colspan="2"><input type="text" id="products" name="products"/><br/></td>
				</tr>		
			</table>
		</div>	
		<br/><br/>
		<p class="line"></p>
		<div id="wrapper2">
			<br/>
			<input id="btnSubmit" class="btn" type="submit" value="회원가입" onclick="return check_seller_register()"/>
			<input class="btn" type="button" value="처음으로" onclick="location.href='ShopController?command=shopping_main'"/>
		</div>
	</form>

</body>
</html>