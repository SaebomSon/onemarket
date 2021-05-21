<%@page import="com.one.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="details" class="com.one.dto.ProductDTO" scope="request"/>

<% 
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<%
	String id = (String)session.getAttribute("userid");

	if(id==null) {
%>
<script>
	alert("로그인 하세요");
	location.href="ShopController?command=shopping_main";
</script>
<%
	}
%>
<script>
	function submit(index) {
		if (index==1) {
			alert('1')
			document.form.action="order.jsp";
		}
		if (index==2) {

			alert('2')
			document.form.action="basket.jsp";
		}
	}
</script>

<style>
hr {
    margin-top: 1rem;
    margin-bottom: 1rem;
    border: 0;
    border-top: 1px solid rgba(0,0,0,.1);
}
section.replyForm textarea { font-size:16px; padding:10px; width:500px;; height:150px; }
section.replyList { padding:30px 0; }
a { text-decoration:none ; color:#000000}

</style>

<title>상세보기</title>
</head>
<body>
	<form action="form" method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm">
					<img style="width: 75%" class="img-fluid" alt="Responsive image" src="img/<jsp:getProperty name='details' property='img_src'/>"/>
				</div>
	
				<div class="col-sm">
					<div class="form-group">
							<label for="productName">제품명</label>
							<!-- <p class="form-control" id="productName" ><jsp:getProperty name="details" property="name"/></p> -->
					
							<label for="productPrice">가격</label>
							<!-- <p class="form-control" id="productPrice" ><jsp:getProperty name="details" property="price"/></p> -->
				
							<label for="productStock">재고</label>
							<!-- <p class="form-control" id="productStock" ><jsp:getProperty name="details" property="stock"/></p> -->
							
							<a class="btn btn-primary" href="ShopController?command=shopping_order&idx=<jsp:getProperty name='details' property='idx'/>">주문하기</a>
							<a class="btn btn-primary" href="ShopController?command=shopping_insertBasket&idx=<jsp:getProperty name='details' property='idx'/>">장바구니 추가</a>
							
					</div>
				</div>
			</div>
		</div>
	</form>
	<br/>
		<nav class="navbar navbar-light bg-white sticky-bottom">
			<ul class="nav nav-tabs" id="Tab" role="tablist">
				<li class="nav-item">
					<a data-toggle="tab" role="tab" aria-controls="detail" aria-selected="true" class="nav-link active text-black" href="#detail">상세보기</a>
				</li>
				<li class="nav-item">
					<a data-toggle="tab" role="tab" aria-controls="comment" aria-selected="false" class="nav-link text-black" href="ShopController?command=product_reply">구매후기</a> <!-- 연결이될려나... -->
				</li>
			</ul>
		</nav>

	<div class="tab-content" id="TabContent">
 		<div class="text-center tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="detail-tab">
			<h3 id="detail" >제품설명</h3>
			<hr/>
			<p><jsp:getProperty name="details" property="details"/></p>
 		</div>
 		<!-- 원래는 여기서 댓글도 쓰고 확인할려고 했지만 그건 아직 쉽지않네요... -->
	</div>
	
</body>
</html>