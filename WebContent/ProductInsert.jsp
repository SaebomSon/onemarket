<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<style>
	table {
		border-collapse: collapse;
	}
	
	tr, td {
		border: 1px solid black;
	}
	
	th {
		text-align: center;
	}
</style>
<%
	String id = (String)session.getAttribute("userid");
	//int idx = (int)session.getAttribute("idx");
	if(id == null) {
%>
	<script>
		alert("로그인 후 이용 가능합니다.");
		location.href="test.jsp";
	</script>
<%
	}
%>
<title>제품 등록</title>
</head>
<body>

	<form enctype="multipart/form-data" action="ProductInsert_DB.jsp" method="post">
		<div class="container">
		<h1>제품 등록</h1>
		<div class="form-group">
		
			<label for="categorySelect">카테고리</label>
			<select class="custom-select" id="categorySelect" name="category">
				<option value="exercise">운동</option>
				<option value="cook">요리용품</option>
				<option value="cosmetic">화장품</option>
				<option value="men_cloting">남성의류</option>
				<option value="food">음식</option>
				
				<option value="etc">기타</option>
			</select>
			
		</div>
		
		<div class="form-group">
				<label for="productName">제품명</label>
				<input required="required" class="form-control" type="text" id="productName" name="name"/>
		</div>

		<div class="form-group">
				<label for="productPrice">가격</label>
				<div class="input-group">
					<input required="required" id="productPrice" class="form-control" type="text" name="price"/>
					 <div class="input-group-append">
   					 	<span class="input-group-text">원</span>
  					</div>
  				</div>
		</div>

		<div class="form-group">
				<label for="productDetails">제품 설명</label>
				<textarea required="required" class="form-control" id="productDetails" name="details" rows="6"></textarea>
		</div>

		<div class="form-group">
				<label for="productStock">재고</label>
				<input required="required" class="form-control" id="productStock" type="text" name="stock"/>
		</div>

		<div class="form-group">
				<label for="productImg">이미지명</label>
				<input required="required" type="file" class="form-control" id="productImg"  name="img_src">
		</div>

		<input class="btn btn-primary" type="submit" value="제품 등록"/>
		<input class="btn btn-primary" type="reset" value="초기화"/>
		</div>
	</form>
</body>
</html>