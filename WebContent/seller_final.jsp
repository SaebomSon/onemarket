
    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="sellerDTO" class="com.one.dto.SellerDTO" scope="request"/>
<jsp:setProperty name="sellerDTO" property="*"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			
<h1>회원가입완료! db 저장되었는지 확인해주세요 </h1>
<h1>
id : <jsp:getProperty name="sellerDTO" property="id"/> <br/>
pw : <jsp:getProperty name="sellerDTO" property="pw"/> <br/>
name: <jsp:getProperty name="sellerDTO" property="name"/> <br/>
phone: <jsp:getProperty name="sellerDTO" property="phone"/> <br/>
products: <jsp:getProperty name="sellerDTO" property="products"/> <br/>
</h1>

</body>
</html>