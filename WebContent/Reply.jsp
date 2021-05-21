<%@page import="java.util.List"%>
<%@page import="com.one.dto.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 
	request.setCharacterEncoding("UTF-8");

	List<ReplyDTO> list = null;
	int countOfRows = 0;
	list = (List<ReplyDTO>)request.getAttribute("ReplyAll");
	String str = request.getParameter("page");
	int numPage = 1;
	if(str != null ){
		numPage = Integer.parseInt(str);
	}
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<h3 style="text-align: center">구매후기</h3>
		<table class="table table-borderd table-hover" style="text-align: center">
			<thead>
				<tr>
					<th style="width: 20%">번호</th>
					<th style="width: 50%">리뷰</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 20%">작성일</th>
				</tr>
			</thead>
<%	
			for(ReplyDTO r : list) {
				out.println("<tr>");
				out.println("<td>"+r.getRepNo()+"</td>");
				out.println("<td>"+r.getRepCom()+"</td>");
				out.println("<td>"+r.getBuyer_id()+"</td>");
				out.println("<td>"+r.getRepDate()+"</td>");
				out.println("</tr>");
			}
%>
			<tbody>
				<tr>
					<td colspan="4"><a href="ReplyWrite.jsp" class="btn btn-light float-right" type="submit">리뷰 작성</a></td>
				</tr>
			</tbody>
		</table>
<%
	for(int i=1; i<=(countOfRows/10)+1; i++) {
	if(i!=numPage)
		out.println("<a href='ShopController?command=product_reply&page="+i+"' style='text-decoration:underline;'>" + i + "</a> ");
	else
		out.println("<span style='cursor:pointer;'>" + i + "</span>");
}
%>
	</div>
</body>
</html>