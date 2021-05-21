<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 선택</title>
<link rel="stylesheet" href="css/choose_register.css" type="text/css">
</head>
<body>

<h1 class="head" onclick="location.href='MainPage.jsp'" title="메인페이지로 이동">ONE MARKET</h1>
<h1 class="box"></h1>
<p>회원가입 시 ONE MARKET에서 제공하는 다양한 서비스를 편리하게 이용하실 수 있습니다.</p><br/><br/>

	
<h3>회원가입 유형 선택</h3>
<p>회원가입 유형에 따라 가입절차는 다르게 진행됩니다. 회원가입 유형을 선택해 주세요.</p><br/>
<div id="wrapper">
	<input  class="btn" type="button" value="소비자 회원가입" onclick="location.href='buyer_register.jsp'"
		title="만 14세 이상 일반 소비자"/>
	<input class="btn" type="button" value="판매자 회원가입" onclick="location.href='seller_register.jsp'"
		title="개인이 운영하는 사업체 or 일반 판매자"/>
</div>

		
</body>
</html>