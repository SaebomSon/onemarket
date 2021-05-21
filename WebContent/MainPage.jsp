<%@page import="com.one.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file ="header.jsp" %>
<jsp:useBean id="product" class="com.one.dto.ProductDTO" />
<%
	List<ProductDTO> list = null;
	List<ProductDTO> list_top6 = null;
	list = (List<ProductDTO>) request.getAttribute("product_list");
	if (request.getAttribute("top6_list") != null) {
		list_top6 = (List<ProductDTO>) request.getAttribute("top6_list");
	}

	session.getAttribute("b_idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>


	<div class="container-fluid">
		<%
			if (list_top6 != null) {

				out.println("<h2>최고조회수</h2><br>");
			}
		%>

		<div class="row">

			<%
				if (list_top6 != null) {
					for (int i = 0; i < list_top6.size(); i++) {
						out.println("<div class= \"col-2 card\">");
						product = list_top6.get(i);

						out.println("<img src=\"img/" + product.getImg_src() + "\" class=\"card-img-top\" >");

						out.println("<div style='padding:15px' class=\"info\">");

						out.println("<h1>" + product.getName() + "</h1>");
						out.println(product.getPrice() + "원<br>");
						out.println("재고: " + product.getStock() + "<br>");
						out.println("품목: " + product.getCategory() + "<br>");
			%>
			<a
				href="ShopController?command=shopping_product&idx=<%=product.getIdx()%>"
				class="btn btn-primary stretched-link">상세보기</a>
			<%
				out.println("</div>");

						out.println("</div>");

					}
				}
			%>
			<h2>추천목록</h2><br>
			<div class="row">
			<%
				if (session.getAttribute("b_idx") != null) {
					if (request.getAttribute("suggestion_list") != null) {
						
						
						List<ProductDTO> list_suggestion = null;
						list_suggestion = (List<ProductDTO>) request.getAttribute("suggestion_list");

						for (int i = 0; i < list_suggestion.size(); i++) {
							out.println("<div class= \"col-2 card\">");
							product = list_suggestion.get(i);

							out.println("<img src=\"img/" + product.getImg_src() + "\" class=\"card-img-top\" >");

							out.println("<div style='padding:15px' class=\"info\">");

							out.println("<h1>" + product.getName() + "</h1>");
							out.println(product.getPrice() + "원<br>");
							out.println("재고: " + product.getStock() + "<br>");
							out.println("품목: " + product.getCategory() + "<br>");
				%>
				<a
					href="ShopController?command=shopping_product&idx=<%=product.getIdx()%>"
					class="btn btn-primary stretched-link">상세보기</a>
				<%
					out.println("</div>");

							out.println("</div>");
							
						}

					}
				}
			%>

		</div>
	</div>

	<div class="container p-3 ">
		<h2>상품목록</h2>
		<%
			if (list.size() == 0) {
				out.println("검색된 상품이 없습니다");
			}
		%>
		<div class="card-columns">

			<%
				for (int i = 0; i < list.size(); i++) {
					out.println("<div class=\"card\">");
					product = list.get(i);

					out.println("<img src=\"img/" + product.getImg_src() + "\" class=\"card-img-top\" >");

					out.println("<div style='padding:15px' class=\"info\">");

					out.println("<h1>" + product.getName() + "</h1>");
					out.println(product.getPrice() + "원<br>");
					out.println("재고: " + product.getStock() + "<br>");
					out.println("품목: " + product.getCategory() + "<br>");
			%>
			<a
				href="ShopController?command=shopping_product&idx=<%=product.getIdx()%>"
				class="btn btn-primary stretched-link">상세보기</a>
			<%
				out.println("</div>");

					out.println("</div>");

				}
			%>

		</div>
	</div>
<%@ include file ="footer.jsp" %>
</body>
</html>











