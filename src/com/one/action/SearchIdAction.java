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
         if(usertype.equals("seller")) { //������ư �Ǹ��� üũ�Ѱ�� 
            String id = sellerdao.searchId(name, phone); //id��  db�� �ִ� id��(=searchId�޼���)�� ����� 
            if(id != null ) {
               request.setAttribute("id", id);
               String url = "search_id_s.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            } else { // id ==null
               System.out.println("�̸�, ����ó ����ġ. �ٽ�Ȯ������ ");
               String url = "search_id_f.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            }
         } else { //radio button - buyer�� �����������. 
            String id = buyerdao.searchId(name, phone);
            if(id!=null) {
               request.setAttribute("id", id);
               String url = "search_id_s.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            } else {
               System.out.println("�̸�, ����ó ����ġ. �ٽ� Ȯ������");
               String url = "search_id_f.jsp";
               request.getRequestDispatcher(url).forward(request, response);
            }
            
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      
      
      
      
      
   }

}