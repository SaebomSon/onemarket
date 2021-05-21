<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.one.dao.ReplyDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="replyadd" class="com.one.dto.ReplyDTO" scope="request"/>
<jsp:setProperty name="replyadd" property="*"/>

<%
	ReplyDAO pDao = new ReplyDAO();
	pDao.addReply(request.getParameter("buyer_id"), request.getParameter("repCom"), (Integer.parseInt(request.getParameter("product_idx"))));
%>

<%
	RequestDispatcher rd = request.getRequestDispatcher("ShopController?command=product_reply"); // ....?
	rd.forward(request, response);
%>