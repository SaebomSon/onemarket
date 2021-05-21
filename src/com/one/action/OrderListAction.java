package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.OrdersDAO;
import com.one.dao.ProductDAO;
import com.one.dto.InnerJoinDTO;
import com.one.dto.OrdersDTO;
import com.one.dto.ProductDTO;

// 구매목록 보기
public class OrderListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MyOrderList.jsp";
		
		HttpSession session = request.getSession();
		int b_idx = (int) (session.getAttribute("b_idx"));
		
		OrdersDAO odao = OrdersDAO.getInstance();
		ArrayList<InnerJoinDTO> olist = null;
		olist = odao.completeOrder(b_idx);
		
		request.setAttribute("olist", olist);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
