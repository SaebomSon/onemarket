package com.one.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.BuyerDAO;
import com.one.dao.SellerDAO;
import com.one.dto.BuyerDTO;
import com.one.dto.SellerDTO;

public class SearchIdAction implements Action {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      String name = request.getParameter("name");
      String phone = request.getParameter("phone");
      String usertype = request.getParameter("radiotype");
      
      //seller
      SellerDAO sellerdao = SellerDAO.getInstance();
      SellerDTO sellerdto = new SellerDTO();
      sellerdto.setId(request.getParameter("id")); 

      //buyer
      BuyerDAO buyerdao = BuyerDAO.getInstance();
      BuyerDTO buyerdto = new BuyerDTO();
      buyerdto.setId(request.getParameter("id")); 
      
      
      try {
         if(usertype.equals("seller")) { //라디오버튼 판매자 체크한경우 
            String id = sellerdao.searchId(name, phone); //id에  db에 있는 id값(=searchId메서드)를 담아줘 
            if(id != null ) {
               request.setAttribute("id", id);
               String url = "search_id_s.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            } else { // id ==null
               System.out.println("이름, 연락처 불일치. 다시확인해죠 ");
               String url = "search_id_f.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            }
         } else { //radio button - buyer로 선택했을경우. 
            String id = buyerdao.searchId(name, phone);
            if(id!=null) {
               request.setAttribute("id", id);
               String url = "search_id_s.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            } else {
               System.out.println("이름, 연락처 불일치. 다시 확인해죠");
               String url = "search_id_f.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            }
            
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      
      
      
      
      
   }

}