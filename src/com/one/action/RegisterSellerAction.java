package com.one.action;

import java.io.IOException;  

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.SellerDAO;
import com.one.dto.SellerDTO;

public class RegisterSellerAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//request.setCharacterEncoding("UTF-8");
System.out.println(request.getParameter("name"));
      SellerDTO dto = new SellerDTO();
      dto.setId(request.getParameter("id"));
      dto.setPw(request.getParameter("pw"));
      dto.setName(request.getParameter("name"));
      dto.setPhone(request.getParameter("phone"));
      dto.setProducts(request.getParameter("products"));
      

      SellerDAO dao = SellerDAO.getInstance();
   
      try {
         dao.insertSeller(dto);
      } catch (Exception e){
         e.printStackTrace();
      }


      request.setAttribute("sellerDTO", dto);
      System.out.println("¿Ã∏ß : " + dto.getName());

      String url = "login_page.jsp";
      request.getRequestDispatcher(url).forward(request, response);
      
   }

}