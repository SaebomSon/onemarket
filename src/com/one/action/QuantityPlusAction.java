package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BasketDAO;

public class QuantityPlusAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "ShopController?command=shopping_basket";
	
		int idx = Integer.parseInt( request.getParameter("idx"));
		int quantity = Integer.parseInt( request.getParameter("quantity"));
		
		BasketDAO dao = BasketDAO.getInstance();
		try {
			if(quantity<10) {
			dao.plusQuan(idx);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
