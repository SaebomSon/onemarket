package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BasketDAO;
import com.one.dao.BuyerDAO;
import com.one.dao.OrdersDAO;
import com.one.dto.BasketDTO;
import com.one.dto.BuyerDTO;
import com.one.dto.OrdersDTO;

public class OrderAction implements Action {
	// 주문하기 버튼 누르면 orderView에 setAttribute
	// 상품정보(장바구니에서 가져오기)
	// 주문자 정보 가져오기(buyer에게서 가져오기)
	// 배송지 정보 입력 받거나, 위에서 가져오기
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "OrderView.jsp";

		// buyerIdex 받아오기
		HttpSession session = request.getSession();
		int b_idx = (int) (session.getAttribute("b_idx"));

		// 상품정보
		// basket의 idx값을 가져옴
		// basket DB에서 선택된 애들 idx로 가져와야함
		BasketDAO basketDao = BasketDAO.getInstance();
		ArrayList<BasketDTO> basketlist = null;
		basketlist = basketDao.showBasket(b_idx);
		//list의 size는 장바구니에 담은 상품 개수
		
		if (request.getParameter("chk") != null) {
			String[] chk_arr = request.getParameterValues("chk");
			int[] b_arr = new int[basketlist.size()];
			
			for(int i = 0; i < basketlist.size(); i++) {
				b_arr[i] = basketlist.get(i).getIdx();
			}
			for(int i = 0; i < basketlist.size(); i++) {
				boolean b1 = false;
				for(int j = 0; j < chk_arr.length; j++) {
					if((b_arr[i]+"").equals(chk_arr[j]) == true) {
						b1 = true;
					}
				}
				if(b1 == false) {
					b_arr[i] = -1;
				}
			}
			
			request.setAttribute("b_arr", b_arr);
			request.setAttribute("basketlist", basketlist);
		}

		
		
		// 주문자 정보
		BuyerDAO buyerDao = BuyerDAO.getInstance();
		ArrayList<BuyerDTO> buyerlist = null;
		buyerlist = buyerDao.getBuyerInfo(b_idx);

		request.setAttribute("buyerlist", buyerlist);
		request.getRequestDispatcher(url).forward(request, response);

	}

}
