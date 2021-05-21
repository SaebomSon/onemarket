package com.one.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ProductDAO;
import com.one.dto.ProductDTO;

public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "MainPage.jsp";
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = null;
		List<ProductDTO> list_top6 = null;
		
		
		try {
			list = dao.showProducts();
			list_top6 = dao.topProducts();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("top6_list", list_top6);
		request.setAttribute("product_list", list);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}




















