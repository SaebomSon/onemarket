package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BasketDAO;
import com.one.dao.ProductDAO;
import com.one.dto.BasketDTO;
import com.one.dto.ProductDTO;

//��ǰ ���������� -> ��ٱ��� ��� ��ư ���� ��
public class InsertBasketAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// buyerIdex �޾ƿ���
		HttpSession session = request.getSession();
		int b_idx = (int) (session.getAttribute("b_idx"));

//		System.out.println(request.getParameter("quantity"));

		int quantity = Integer.parseInt(request.getParameter("quantity"));

//      product��
		int p_idx = Integer.parseInt(request.getParameter("idx"));
		ProductDAO pdao = ProductDAO.getInstance();
		ProductDTO pdto = null;
		pdto = pdao.getProductInfo(p_idx);

		// ��ٱ��� ����
		BasketDAO bdao = BasketDAO.getInstance();
		// ���� ��ǰ �ִ��� ������ check
		ArrayList<BasketDTO> list = null;
		boolean result = bdao.checkBasket(b_idx, p_idx);

		if (result == true) {
			list = bdao.hadProduct(b_idx, p_idx);
		} else {
			list = bdao.insertBasket(b_idx, p_idx, pdto.getName(), pdto.getPrice() * quantity, quantity,
					pdto.getImg_src());
		}

	}

}