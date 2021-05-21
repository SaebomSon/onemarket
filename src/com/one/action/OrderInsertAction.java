package com.one.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.one.dao.BasketDAO;
import com.one.dao.OrdersDAO;
import com.one.dao.ProductDAO;
import com.one.dto.BasketDTO;
import com.one.dto.OrdersDTO;
import com.one.dto.ProductDTO;

public class OrderInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문하기 화면에서 결제하기 버튼 누른 후
		// order table에 insert 해야함
		
		ProductDAO pdao = ProductDAO.getInstance();
		ProductDTO pdto = null;
		BasketDAO bdao = BasketDAO.getInstance();
		BasketDTO bdto = null;

		HttpSession session = request.getSession();
		int b_idx = (int) (session.getAttribute("b_idx"));
		
		// payment_method 받아오기
		String pay = request.getParameter("pay");
		System.out.println("결제방법" + pay);
		
		OrdersDAO odao = OrdersDAO.getInstance();
		OrdersDTO odto = null;
		
		// product_idx 받아옴
		String myIdx_str = request.getParameter("myIdx");
		String[] myIdx = myIdx_str.split("_");
		String p_idx_str = null;
		
		int p_idx = 0;
		for (int i = 0; i < myIdx.length; i++) {
			p_idx_str = myIdx[i];
			p_idx = Integer.parseInt(p_idx_str);
			System.out.println(p_idx);
			odto = new OrdersDTO(b_idx, pdto.getSeller_idx(), p_idx, pay, bdto.getQuantity());
		}
		try {
			pdto = pdao.getProductInfo(p_idx);
			bdto = bdao.getQuantityInfo(b_idx, p_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("seller : "+pdto.getSeller_idx());
		
		ArrayList<OrdersDTO> olist = null;
		olist = odao.insertProduct(odto);
		if(olist == null) {
			System.out.println("olist가 null임");
			
		}else {
			System.out.println("olist가 null 아님");
		}

		String url = "OrderResult.jsp";
		request.getRequestDispatcher(url).forward(request, response);

	}

}
