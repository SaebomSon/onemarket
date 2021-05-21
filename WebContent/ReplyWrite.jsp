<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	//String id = (String)session.getAttribute("id");
	String id = "asd";
	int product_idx = (int)session.getAttribute("product_idx");
%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form method="post" action="ReplyWriteAction.jsp"> <!-- 모르겠네요... -->
			<table class="table table-borderd table-hover">
				<thead style="text-align: center">
					<tr>
						<th colspan="4"><h3>후기 작성</h3></th>
					</tr>
				</thead>
				<tbody>
					<tr style="text-align: center">
						<td colspan="4"><%= id %>
						<input type="hidden" name="buyer_id" value="<%= id %>"/>
						<input type="hidden" name="product_idx" value="<%= product_idx %>"/></td>
					</tr>
					<tr>
						<td>리뷰</td>
						<td><textarea class="form-control" rows="10" name="repCom" maxlength="2000"></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary float-right" value="작성완료"/>
		</form>
	</div>	
					

</body>
</html>