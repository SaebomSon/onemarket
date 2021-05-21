<%@page import="com.one.dto.BasketDTO"%>
<%@page import="com.one.dto.BuyerDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="product" class="com.one.dto.ProductDTO" scope="request" />
<jsp:useBean id="byuer" class="com.one.dto.BuyerDTO" scope="request" />
<%@ include file ="header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<BasketDTO> basketlist = null;
	basketlist = (ArrayList<BasketDTO>)(request.getAttribute("basketlist"));
	
	ArrayList<BuyerDTO> buyerlist = null;
	buyerlist = (ArrayList<BuyerDTO>)(request.getAttribute("buyerlist"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>주문 페이지</title>
<script>
	$(document).ready(function(){
		$("#newAdr").hide();
		
		$("input[name=addr]").change(function(){
			var radioVal = $(this).val();
			if(radioVal == 0){
				$("#userAdr").show();
				$("#newAdr").hide();
			}else if(radioVal == 1){
				$("#userAdr").hide();
				$("#newAdr").show();
			}
		});
	});
	
</script>
<style>
	.container{
		width:40rem;
	}
</style>
</head>
<body>
<h1 class="text-center">주문하기</h1>
<div class="container">
	<form action="ShopController?command=shopping_insertOrder" method="post">
	<div class="">
		<table class="table table-striped my-5">
		<thead>
			<tr>
				<th colspan="4">상품정보</th>
			</tr>
		</thead>
			<%		
					String myIdx = "";
					int total = 0;
					int[] b_arr = (int[])request.getAttribute("b_arr");
					for(int i = 0; i < b_arr.length; i++){
						if(b_arr[i] == -1){
							continue;
						}
			%>
			<tbody>
			<tr>
				<td><img src="img/<%=basketlist.get(i).getImg_src()%>" style="width:100px; height:80px;"/></td>
				<td><%=basketlist.get(i).getP_name()%></td>
				<td><%=basketlist.get(i).getQuantity() %></td>
				<td style="text-align:center;"><%
					myIdx += basketlist.get(i).getP_idx() +"_";
					total += basketlist.get(i).getP_price();
				%><%=basketlist.get(i).getP_price() %></td>
			</tr>
			<%} %>
			<input type="hidden" name="myIdx" value="<%=myIdx %>"/>
			<tr>
				<th colspan="3" style="text-align:right;">
				총 금액 | 
				</th>
				<th style="text-align:center;">
				<%= total%>
				</th>
			</tr>
			</tbody><br/>
		</table>
	</div>
	<div>
		<table class="table table-striped my-5">
		<thead>
			<tr>
				<th colspan="2">주문자 정보</th>
			</tr>
			</thead>
			<%
					for(int i = 0; i < buyerlist.size(); i++){
			%>
			<tbody>
			<tr>
				<th>이름</th>
				<td><%= buyerlist.get(i).getName() %></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=buyerlist.get(i).getPhone() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%= buyerlist.get(i).getEmail() %></td>
			</tr>
			</tbody>
		<%} %>
		</table>
	</div>

	<div>
		<table class="table table-striped my-5">
			<thead>
			<tr><th colspan="2">배송 정보</th>	
			<td colspan="2" style="text-align:center;">
			<input type="radio" name="addr" id="addr1" checked="checked" value="0"/>주문자와 동일
			<input type="radio" name="addr" id="addr2" value="1" style="margin-left:4rem;"/>직접 입력
			</td></tr>
			</thead>
			<%
					for(int i = 0; i < buyerlist.size(); i++){
			%>
			<!-- 주문자와 동일 -->
			<tbody id="userAdr">
			<tr>
				<th>주소</th>
				<td colspan="3"><%=buyerlist.get(i).getAddress()%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><%=buyerlist.get(i).getName() %></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="3"><%=buyerlist.get(i).getPhone() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3"><%=buyerlist.get(i).getEmail() %></td>
			</tr>
			</tbody>
			<!-- 직접 입력창 -->
			<tbody id="newAdr">
			<tr>
				<th>주소</th>
				<td colspan="3"><input type="text" id="address" name="address"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><input type="text" id="name" name="name"/> </td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td colspan="3"><input type="text" id="phone" name="phone"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3"><input type="text" id="email" name="email"/></td>
			</tr>
			</tbody>
			<%} %>
		</table>
	</div>
	<div>
		<table class="table table-striped my-5">
			<thead><tr><th colspan="3">결제수단</th></tr></thead>
			<tbody>
			<tr>
				<th>결제 방법</th>
				<td><input type="radio" id="card" name="pay" value="card" checked="checked"/>카드</td>
				<td><input type="radio" id="account" name="pay" value="account"/>계좌이체</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="selPay my-5 text-center">
		<a href="ShopContoller?command=show_orderlist">
		<input type="submit" class="btn btn-primary" id="btnPay" value="결제하기" /></a>
		<button type="button" class="btn btn-warning" id="btnCancle">취소하기</button>
	</div>
</form>
</div>
</body>
</html>