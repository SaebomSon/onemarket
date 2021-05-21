package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BuyerDAO;
import com.one.dao.SellerDAO;
import com.one.dto.SellerDTO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id"); 
		String pw = request.getParameter("pw");

		SellerDAO sellerdao = SellerDAO.getInstance();
		BuyerDAO buyerdao = BuyerDAO.getInstance();
		
		try {
			if(sellerdao.sellerLoginCheck(id, pw)) {
				
				String msg = "濡쒓렇�씤�뿉 �꽦怨� �븯�뀲�뒿�땲�떎.";
				String url = "ShopController?command=shopping_main"; //MainPage.jsp占쎈퓠占쎄퐣 getAttribute
				request.getSession().setAttribute("s_msg", msg);
				request.getSession().setAttribute("userid", id);
				request.getSession().setAttribute("usertype", "판매자");
				request.getSession().setAttribute("userpw", pw);
				int idx = sellerdao.getIdx(id);
				request.getSession().setAttribute("s_idx", idx);
				request.getRequestDispatcher(url).forward(request, response);

			} else if(buyerdao.loginMember(id,pw)){
	               String msg = "濡쒓렇�씤�뿉 �꽦怨� �븯�뀲�뒿�땲�떎.";
	               String url = "ShopController?command=shopping_main"; //MainPage.jsp占쎈퓠占쎄퐣 getAttribute    
	               request.getSession().setAttribute("s_msg", msg);
	               request.getSession().setAttribute("userid", id);
	               request.getSession().setAttribute("usertype", "소비자");
	               request.getSession().setAttribute("userpw", pw);
	               int idx = buyerdao.getIdx(id);
	               request.getSession().setAttribute("b_idx", idx);
	               request.getRequestDispatcher(url).forward(request, response);
	        } else {

				String msg = "濡쒓렇�씤 �떎�뙣!";
				request.setAttribute( "f_msg", msg);
				String url = "login_page.jsp";
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	}

}
