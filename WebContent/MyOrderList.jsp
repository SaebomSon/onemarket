<%@page import="com.one.dto.InnerJoinDTO"%>
<%@page import="com.one.dto.ProductDTO"%>
<%@page import="com.one.dto.OrdersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>구매 내역 보기</title>
</head>
<body>
	<div class="orderList">

		<h2 class="text-center my-5">구매 내역</h2>
		<table class="list_order table table-striped my-5">
		<%
			ArrayList<InnerJoinDTO> olist = null;
    		olist = (ArrayList<InnerJoinDTO>)(request.getAttribute("olist"));
    		    		
    			for(int i = 0; i < olist.size(); i++){
		%>
			<tr>
				<th><%=olist.get(i).getOrder_date()%></th>
			</tr>
			<tr>
				<th>주문 번호</th>
				<td><%=olist.get(i).getP_name() %></td>
			</tr>
			<tr>
				<th>주문 수량</th>
				<td><%=olist.get(i).getP_price() %></td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td><%=olist.get(i).getPayment_method() %></td>
			</tr>
			
		<%} %>
		</table>
	</div>
</body>
</html>