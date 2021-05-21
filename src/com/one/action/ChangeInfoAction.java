package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BuyerDAO;
import com.one.dto.BasketDTO;
import com.one.dto.BuyerDTO;

public class ChangeInfoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int b_idx = (int)(session.getAttribute("b_idx"));
		
		BuyerDAO dao = BuyerDAO.getInstance();
		ArrayList<BuyerDTO> list = null;
		list = dao.getBuyerInfo(b_idx);
		
		String url = "ChangeMyInfo.jsp";
		request.setAttribute("list", list);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
