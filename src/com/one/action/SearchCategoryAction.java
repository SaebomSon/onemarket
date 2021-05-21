package com.one.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ProductDAO;
import com.one.dto.ProductDTO;

public class SearchCategoryAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="MainPage.jsp";

		String Search = request.getParameter("Category");

		ProductDAO dao = ProductDAO.getInstance();
		
		List<ProductDTO>  list = null;
		
		try {
			list = dao.searchProductsByCategory(Search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		request.setAttribute("product_list", list);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
