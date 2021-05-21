package com.one.action;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BuyerDAO;
import com.one.dto.BuyerDTO;

@WebServlet("/IdTestAction")
public class IdTestAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdTestAction() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서버 응답 받음. id:" + request.getParameter("id"));
		
		// 여기서 id check form jsp 에서 온거임
		String id = request.getParameter("id");
		
		BuyerDAO dao = BuyerDAO.getInstance();
		// dao 싱글톤 객체생성 
		
		
		BuyerDTO DTO;
		try {
			DTO = dao.selectMemberById(id);
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
		 	
			
			// DTO가 안와야 중복아님 
			// DTO가 있으면 중복임 
			if(DTO == null) {
				System.out.println("ID 중복아님.");
				out.println("1");	// 1 : 아이디 중복아님.
			} else {
				System.out.println("ID 중복임.");
				out.println("0");	// 0 : 아이디 중복임.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
