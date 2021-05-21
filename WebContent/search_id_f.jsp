<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 실패</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<style>
	.tdcss { height:200px; width:300px; text-align:center; color:purple;}
</style>
<body>
		
<h1 class="head"  onclick="location.href='ShopController?command=shopping_main'" title="메인페이지로 이동">ONE MARKET</h1>
<h1 class="box"></h1>
<p>아이디 찾기 실패</p>

<div id="wrapper">
	<table>
		<tr>
			<td class="tdcss"> 
			아이디 확인 실패! <br/>
			고객님의 이름 혹은 연락처가 다릅니다.<br/>
			다시 확인해주세요.<br/>
			</td>
		</tr>
	</table>
</div>	
<p class="line"></p><br/>
<div id="wrapper2">
		<input class="btn" type="submit" value="아이디 다시 찾기" onclick="location.href='search_id.jsp'"/>
	</div>
</body>
</html>