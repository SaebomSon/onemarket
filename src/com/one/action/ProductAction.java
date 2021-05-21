package com.one.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ProductDAO;
import com.one.dao.SellerDAO;
import com.one.dto.ProductDTO;
import com.one.dto.SellerDTO;

public class ProductAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "ProductDetails_test1.jsp";
		int idx = Integer.parseInt( request.getParameter("idx") );
		
		ProductDAO p_dao = ProductDAO.getInstance();
		SellerDAO s_dao = SellerDAO.getInstance();
		
		ProductDTO p_dto = null;
		SellerDTO s_dto = null;
		
		try {
			p_dto = p_dao.showProduct(idx);
			s_dto = s_dao.showSeller(p_dto.getSeller_idx());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("details", p_dto);
		request.setAttribute("seller", s_dto);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
//		String url="ProductDetails_test1.jsp";
//		int idx = Integer.parseInt(request.getParameter("idx")); // main에서 눌렀을때 idx를 받아오게 하면 작동
//		ProductDAO pDAO = ProductDAO.getInstance();
//		ProductDTO pDTO = null;
//
//		
//		try {
//			pDTO = pDAO.showProduct(idx);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//
//		request.setAttribute("details", pDTO);
//		RequestDispatcher rd = request.getRequestDispatcher(url);
//		rd.forward(request, response);
	}

}






