package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.one.dao.BuyerDAO;
import com.one.dto.BuyerDTO;


public class RegisterMemberAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getParameter("name"));
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		BuyerDAO Buyerdao = BuyerDAO.getInstance();
		BuyerDTO Buyervo = new BuyerDTO();
		Buyervo.setId(request.getParameter("id"));
		Buyervo.setPw(request.getParameter("pw"));
		Buyervo.setAddress(request.getParameter("address"));
		Buyervo.setPhone(request.getParameter("phone"));
		Buyervo.setName(request.getParameter("name"));
				
		String[] interest = request.getParameterValues("interest");
		String result =""; 
		
		for(String val : interest) {
		       result +="_"+val;
		}
				
		Buyervo.setInterest(result);
		
		
		Buyervo.setGender(request.getParameter("gender"));
		Buyervo.setEmail(request.getParameter("email"));
		
		
		try {
			Buyerdao.insertBuyer(Buyervo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
				
		
		request.getRequestDispatcher("login_page.jsp").forward(request, response);
		
		
		
	}
}
