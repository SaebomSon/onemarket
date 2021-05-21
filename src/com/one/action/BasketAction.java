package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BasketDAO;
import com.one.dto.BasketDTO;

//��ٱ��� ȭ�� -> �ֹ�ȭ������
public class BasketAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "BasketView.jsp";
		
		//���ο��� b_idx �޾ƿ���
		HttpSession session = request.getSession();
		int b_idx = (int)(session.getAttribute("b_idx"));
		
		BasketDAO bdao = BasketDAO.getInstance();
		ArrayList<BasketDTO> list = null;
		
		list = bdao.showBasket(b_idx);
		request.setAttribute("basket", list);
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
