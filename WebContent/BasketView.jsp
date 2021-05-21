<%@page import="com.one.dao.BasketDAO"%>
<%@page import="com.one.dto.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.one.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ include file ="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<BasketDTO> list = null;
list = (ArrayList<BasketDTO>)(request.getAttribute("basket"));

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
   $(document).ready(function(){
   // 체크 박스-전체 선택
      $("#checkall").click(function(){
         if($("#checkall").prop("checked")){
            $("input[name=chk]").prop("checked", true);
         }else{
            $("input[name=chk]").prop("checked", false);
         }
      });
   });
   
   // 수량 받아오기
   function changeQuantity(idx){
      var quantity = document.getElementById("quantity_"+idx).value;
      var total = Number(document.getElementById("total").innerHTML)
      var initial_price = Number(document.getElementById("p_price_"+idx).innerHTML/quantity);
      var total_price = Number(document.getElementById("p_price_"+idx).innerHTML);
      
      $('.up_'+idx).click(function plus(){
         quantity++;
         total_price+=initial_price;
         if(quantity > 10){
            //버튼 클릭 수 만큼 alert가 실행됨ㅠㅠ
            //alert("최소 구매 가능 개수는 10개");
            return quantity;
         }
         //count값을 inputNum에 다시 넣어야함
         document.getElementById("quantity_"+idx).value = quantity;
         document.getElementById("p_price_"+idx).innerHTML = total_price;
      });
      
      $('.down_'+idx).click(function plus(){
         quantity--;
         total_price-=initial_price;
         
         if(quantity <= 0){
            //alert("최소 구매 가능 개수는 1개");
            return quantity;
         }
         document.getElementById("quantity_"+idx).value = quantity;
         document.getElementById("p_price_"+idx).innerHTML = total_price;
      });
      
   }
</script>
<title>장바구니</title>
</head>
<body>
   <div class="container" style="width:60rem;">
   <form id="basket" action="ShopController?command=shopping_order" method="post" role="form">
      <div id="cart_main">
         <div class="basket_header">
            <h1 class="text-center my-5">장바구니</h1>
         </div>
         <div class="user-form select_cart">
               <div class="tbl_comm tbl_header">
                  <table class="table table-bordered" align="center">
                     <thead>
                        <tr>
                           <th scope="col" class="checkall">
                              <label class="checkall text-center">
                                 <input type="checkbox" id="checkall" name="checkall" checked="checked"/>
                                 전체 선택</label>
                              </th>
                           <th scope="col" id="productTit">상품 정보</th>
                           <th scope="col" id="quanTit">수량</th>
                           <th scope="col" id="priceTit">상품 금액</th>
                        </tr>
                     </thead>
                     <tbody>
                     <%   
                        for(int i = 0; i < list.size(); i++){
                           if(list.size() == 0){
                     %>
                     <tr><th>장바구니가 비었습니다.</th></tr>
                     <%      
                           }else{
                     %>
                        <tr class ="<%=i%>">
                           <td scope="row" class="one_check">
                              <label class="one_check">
                                 <input type="checkbox" id="check_" name="chk" value="<%=list.get(i).getIdx()%>" checked="checked"/>
                              <img src="img/<%=list.get(i).getImg_src() %>" style="width:50px; height:100px;"/></label>
                           </td>
                           <td><%=list.get(i).getP_name() %></td>
                           <td>
                              <span class="quantity">
                                 <button type="button" class="btn down_<%=i %>" id="btnMinus" onclick="location.href='ShopController?command=quantity_minus&idx=<%=list.get(i).getIdx()%>&quantity=<%=list.get(i).getQuantity() %>'">-</button>
                                 <input type="number" id="quantity_<%=i %>" name="quantity" value= "<%=list.get(i).getQuantity() %>" readonly="readonly" style="width:2rem;"/>
                                 <button type="button" class="btn up_<%=i %>" id="btnPlus" onclick="location.href='ShopController?command=quantity_plus&idx=<%=list.get(i).getIdx()%>&quantity=<%=list.get(i).getQuantity() %>'">+</button>
                              </span>
                           </td>
                           <td id="p_price_<%=i %>"><%=list.get(i).getP_price()%></td>
                           
                        </tr>
                        <% }
                        } %>
                     </tbody>
                  </table>
               </div>
         </div>
         <!-- select_cart -->
         <span class="btn_del">
            <button type="button" id="btn_del" class="btn_del btn btn-light" onclick="location.href='ShopController?command=del_basket'">삭제</button>
         </span>
         
         <div class="bordered">
            <label class="label_total">총 금액</label>
            <span id="total">
            <%   
            
               int sum = 0;
               int quan = 0;
               int price = 0;
               int total = 0;
               
               for(int i = 0; i < list.size(); i++){
                  quan = list.get(i).getQuantity();
                  price = list.get(i).getP_price();
                  sum = price;
                  total += sum;
               }
            %>
            <%=total %>
            </span>
         </div>
         <div class="btn_order text-center">
            <input type="submit" class="btn_order btn btn-light" value="주문하기"/>
         </div>
      </div>
      </form>
      <!-- cart_main -->
   </div>
   <!-- container -->
</body>
</html>