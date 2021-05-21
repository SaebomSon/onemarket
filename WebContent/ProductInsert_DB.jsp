<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.one.dao.ProductDAO"%>
<%@page import="com.one.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="product" class="com.one.dto.ProductDTO" scope="request" />

<%
	String uploadPath = request.getRealPath("img");
	

	int size = 10*1024*1024;

	
	String category = "";
	String name = "";
	String img_src = "";
	int price = 0;
	int stock = 0;
	String details = "";
	try{
	    MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
			
	    name = multi.getParameter("name");
	    category = multi.getParameter("category");
		price = Integer.parseInt( multi.getParameter("price"));
		stock = Integer.parseInt( multi.getParameter("stock"));
		details = multi.getParameter("details");
	    
		
	    Enumeration files = multi.getFileNames();
	    String file1 = (String)files.nextElement();
	    img_src = multi.getFilesystemName(file1);

	    System.out.println(img_src);

	}catch(Exception e){
	    e.printStackTrace();
	}
	
	
	ProductDTO p_dto = new ProductDTO();
	p_dto.setName(name);
	p_dto.setCategory(category);
	p_dto.setPrice(price);
	p_dto.setStock(stock);
	p_dto.setDetails(details);
	p_dto.setImg_src(img_src);
	int s_idx = (int)session.getAttribute("s_idx");
	
	int n = 0;
	ProductDAO productDao = ProductDAO.getInstance();
	if (n == 0) {
		productDao.insertProduct(p_dto,s_idx);
		n++;
	}

	if (n == 1) {
%>

<script>
	alert("정상 처리되었습니다.");
	location.href = "ShopController?command=shopping_main";
</script>



<%
	} else {
%>
<script>
	alert("오류 발생!\n관리자에게 문의 하시오");
	//location.href = "MainPage.jsp";
</script>

<%
	}
%>