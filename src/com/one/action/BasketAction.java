package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BasketDAO;
import com.one.dto.BasketDTO;

//장바구니 화면 -> 주문화면으로
public class BasketAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "BasketView.jsp";
		
		//메인에서 b_idx 받아오기
		HttpSession session = request.getSession();
		int b_idx = (int)(session.getAttribute("b_idx"));
		
		BasketDAO bdao = BasketDAO.getInstance();
		ArrayList<BasketDTO> list = null;
		
		list = bdao.showBasket(b_idx);
		request.setAttribute("basket", list);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
