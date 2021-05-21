package com.one.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.SellerDAO;
import com.one.dto.SellerDTO;

public class SellerIdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		SellerDAO dao = SellerDAO.getInstance();

		SellerDTO dto;
		try {
			dto = dao.selectMemberById(id);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(dto == null) {
				out.println("1");
			} else {
				out.println("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
