<%@page import="com.one.dto.BuyerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>회원정보 수정</title>
<script>
$(document).ready(function() {
	$('#update').on('click', function() {
		swal({
			title : "수정 완료",
			text : "회원정보가 수정되었습니다!",
			icon : "success",
			closeOnClickOutside : false,
			closeOnEsc : false,
			showConfirmButton: false,
			timer : 3000
		});

	});

});
</script>
<style>
	p { text-align:center; }
	table { margin-left:auto; margin-right:auto; text-align:center;}
	td { height :40px; width: 150px; text-align:left;}
	input { vertical-align: middle; width:200px; height:30px; border:1px solid gray; border-radius:5px; text-indent:10px;}
	.container2 { text-align:center;}
	.btn {  
			text-align: center;
			border-radius:5px; width:170px; height:35px; 
			border:1px solid linear-gradient(30deg, #fd6585, #0d25b9);
			background:-webkit-linear-gradient(30deg, #fd6585, #0d25b9);
			color: transparent;
			-webkit-background-clip: text;
			font-weight:bolder;
		}
		
	.btn:hover {
			border: 1px solid #aaaaaa;
			background: linear-gradient(30deg, #fd6585, #0d25b9);
			color:white;
		}
	#search {
			border-radius:5px; width:170px; height:35px; 
			border:1px solid linear-gradient(30deg, #fd6585, #0d25b9);
			background: linear-gradient(30deg, #fd6585, #0d25b9);
			color: transparent;
			-webkit-background-clip: text;
			font-weight:bolder;
	}
	.line {
		width:23%;
		height:2px;
		margin:0 auto;
		background: -webkit-linear-gradient(30deg, #fd6585, #0d25b9);
	    color: transparent;
	    border-radius:70px 20px;
		}
</style>
</head>
<body>
	<p>회원정보 수정</p><br/>
	<form action="ShopController?command=shopping_updateInfo" method="post">
		<div class = "container1">
		<%
			ArrayList<BuyerDTO> list = null;
			list = (ArrayList<BuyerDTO>)(request.getAttribute("list"));
			for(int i = 0; i < list.size(); i++){
			
		%>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" readonly="readonly" value="${list.get(i).getId() }"/></td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td><input type="password" id="newpw1" name="newpw1"/></td>
				</tr>
				<tr>
					<td>새 비밀번호 재입력</td>
					<td><input type="password" id="newpw2" name="newpw2"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" readonly="readonly" value="${list.get(i).getName() }"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" id="email" name="email" value="${list.get(i).getEmail() }"/></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><input type="text" id="phone" name="phone" value="${list.get(i).getPhone() }"/></td>
				</tr>
				<tr>
					<td rowspan="3">주소</td>
					<td><input type="text" id="address1" value="" placeholder="우편 번호" style="width:135px;"/>
					<input type="button" id="search" value="찾기" style="width:60px; text-align: center;"/></td>
				</tr>
				<tr>
					<td><input type="text" id="address" name="address" value="${list.get(i).getAddress() }"/></td>
				</tr>
				<%-- <tr>
					<td><input type="text" id="address3" value="" placeholder="상세 주소"/></td>
				</tr>--%>
			</table>
			<%} %>
		</div>
		<br/><br/>
		<p class="line"></p>
		<br/>
		<div class = "container2">
			<input type="submit" class="btn" id="update" value="수정 완료"/>
			<input type="button" class="btn" value="취소" onclick="location.href='ShopController?command=shopping_main'"/>
		</div>
	</form>
	
</body>
</html>