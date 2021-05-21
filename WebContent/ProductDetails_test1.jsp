<%@page import="com.one.dto.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.one.dto.ProductDTO"%>
<%@ include file ="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:useBean id="details" class="com.one.dto.ProductDTO" scope="request" />
<jsp:useBean id="seller" class="com.one.dto.SellerDTO" scope="request" />
<jsp:useBean id="replyAll" class="com.one.dto.ReplyDTO" scope="request"/>

<% 
   request.setCharacterEncoding("UTF-8");

   List<ReplyDTO> list = null;
   int countOfRows = 0;
   list = (List<ReplyDTO>)request.getAttribute("ReplyAll");
   String str = request.getParameter("page");
   int numPage = 1;
   if(str != null ){
      numPage = Integer.parseInt(str);
   }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<script type="text/javascript"
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
   crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
hr {
   margin-top: 1rem;
   margin-bottom: 1rem;
   border: 0;
   border-top: 1px solid rgba(0, 0, 0, .1);
}

a {
   text-decoration: none;
   color: #000000
}

section.replyForm textarea {
   font-size: 16px;
   padding: 10px;
   width: 500px;;
   height: 150px;
}

section.replyList {
   padding: 30px 0;
}
</style>

<script>
$(document).ready(function() {
    $('#insert').on('click', function() {
       swal({
          title : "장바구니 추가",
          text : "장바구니에 상품이 추가 되었습니다.",
          icon : "success",
          button : "확인",
          closeOnClickOutside : false,
          closeOnEsc : false,
          
       });

    });

 });


   var product_price;
   var quantity;
   function init () {
      product_price = document.form.product_price.value;
      quantity = document.form.quantity.value;
      document.form.sum.value = product_price;
      change();
   }
   function add () {
      hm = document.form.quantity;
      sum = document.form.sum;
      
      if (hm.value < 15) { // jsp:get 재고 넣어주기
         hm.value ++;
         sum.value = parseInt(hm.value) * product_price;
      }
      
   }
   
   function del () {
      hm = document.form.quantity;
      sum = document.form.sum;
         if (hm.value > 1) {
            hm.value --;
            sum.value = parseInt(hm.value) * product_price;
         }
   }
   function change () {
      hm = document.form.quantity;
      sum = document.form.sum;
   
         if (hm.value < 0) {
            hm.value = 0;
         }

      sum.value = parseInt(hm.value) * product_price;
   }  
</script>

<title>상세보기</title>
</head>
<body onload="init();">
   <div style="padding: 10px;"
      class="jumbotron bg-dark text-center text-white">


      <div id="logoHeader">
         <a href="ShopController?command=shopping_main"><h1>쇼핑몰</h1></a> <img
            alt="" src="">
      </div>

      <div class="container">

         <nav class="navbar" id="usermenu">
         <%if(session.getAttribute("userid")!=null){
               out.println(session.getAttribute("userid")+"님, 환영합니다!");%>
               <a class="btn btn-outline-warning btn-rounded btn-sm my-0" 
               href="ShopController?command=logout">로그아웃</a>
               <% 
               if("소비자".equals((String) session.getAttribute("usertype"))){%>
               <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ShopController?command=shopping_basket">장바구니</a>
               <%
               }
               if("판매자".equals((String) session.getAttribute("usertype"))){%>
                  <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ProductInsert.jsp">제품등록</a>
                  <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ShopController?command=seller_products">판매목록</a>
                  <%
               }
            }else{
               %>
            <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="login_page.jsp">로그인</a>
            <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="choose_register.jsp">회원가입</a>
               
               <%
            }%>
         

            <div class="d-inline dropdown show">
               <a
                  class="btn btn-outline-warning btn-rounded btn-sm my-0 dropdown-toggle"
                  href="#" role="button" id="dropdownMenuLink"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  카테고리 </a>

               <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                  <a class="dropdown-item" id="Category"
                     href="ShopController?command=search_category&Category=exercise">운동</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=cook">요리용품</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=cosmetic">화장품</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=men_clothing">남성의류</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=food">음식</a>



                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=etc">기타</a>
               </div>
            </div>
            <form class="form-inline my-2 my-lg-0" action="ShopController">

               <input class="form-control mr-sm-2" type="text" name="Search"
                  required="required" placeholder="Search" aria-label="Search">

               <input class="btn btn-outline-warning btn-rounded btn-sm my-0"
                  name="command" value="search" type="submit">
            </form>
         </nav>

      </div>

   </div>



   <form name="form" action="<ShopController?command=shopping_order&
                     idx=<jsp:getProperty name='details' property='idx'/>" method="post">
      <div class="container">
         <div class="row">
            <div class="col-sm">
               <img style="width: 75%" class="img-fluid" alt="Responsive image"
                  src="img/<jsp:getProperty name='details' property='img_src'/>" />

            </div>

            <div class="col-sm">
               <div class="form-group">
                  <label for="productName">제품명</label>
                  <p class="form-control" id="productName"><jsp:getProperty
                        property="name" name="details" /></p>

                  <label for="productPrice">가격</label>
                  <p class="form-control" id="productPrice"><jsp:getProperty
                        property="price" name="details" /></p>

                  <label for="productStock">재고</label>
                  <input type="text" class="form-control bg-white" id="productStock" name="pStock" value="<jsp:getProperty
                        property="stock" name="details" />" readonly/>
                  
                  
                  <%if (!"소비자".equals((String) session.getAttribute("usertype"))) {
                  
                  }else{ %>
                  <!-- 수량 quantity 추가했습니다. -->
                  <label for="productquantity">수량</label>
                     <input type=hidden name="product_price" value="<jsp:getProperty
                        property="price" name="details" />">
                     
                     <div class="input-group">
                     <input id="productquantity" class="form-control bg-white" value="1" onchange="change()" type="text" name="quantity" readonly/>
                        <div class="input-group-append">

                               <input type="button" class="btn btn-primary" value=" + " onclick="add();">
                               <input class="btn btn-primary" type="button" value=" - " onclick="del();"><br>
                          </div>
                       </div>
                          <label for="p_q_price">금액</label>
                       <div class="input-group">
                        <input class="form-control bg-white" id="p_q_price" type="text" name="sum" readonly/>
                        <div class="input-group-append">
                               <span class="input-group-text">원  </span>
                          </div>
                       </div>
                       
                    <%} %>
                       
                    
                  <%
                     if (session.getAttribute("s_idx") != null) {
                        if (seller.getIdx() == (int) session.getAttribute("s_idx")) {
                           %>
                           <a style="margin-top: 20px" class="btn btn-warning btn-rounded" href="">제품수정</a>
                           
                           
                           <%
                        }
                     }
                     if (!"소비자".equals((String) session.getAttribute("usertype"))) {

                     } else {
                  %>
                  <input style="margin-top: 20px" type="submit" value="주문하기" class="btn btn-primary" > <!-- 이건 폼에서 넘어가는걸로 했습니다 수량 전달받기 위해서 -->
                  
                  <button style="margin-top: 20px" class="btn btn-primary" id="insert"
                  onclick="insertBasket()" >장바구니
                     추가</button>
                  <%
                     }
                  %>

               </div>
            </div>
         </div>
      </div>
   </form>
   <br />
   <nav class="navbar navbar-light bg-white sticky-bottom">
      <ul class="nav nav-tabs" id="Tab" role="tablist">
         <li class="nav-item"><a data-toggle="tab" role="tab"
            aria-controls="detail" aria-selected="true"
            class="nav-link active text-black" href="#detail">상세보기</a></li>
         <li class="nav-item"><a data-toggle="tab" role="tab"
            aria-controls="comment" aria-selected="false"
            class="nav-link text-black" href="#comment">구매후기</a></li>
      </ul>
   </nav>

   <div class="tab-content" id="TabContent">
      <div class="text-center tab-pane fade show active" id="detail"
         role="tabpanel" aria-labelledby="detail-tab">
         <h3 id="detail">제품설명</h3>
         <div class="row text-center" style="width: 100%">
               <div style="width: 50%; float:none; margin:0 auto" >
               <hr />
                 <p><jsp:getProperty property="details" name="details"/></p>
               </div>
         </div>
      </div>

      <div class="tab-pane fade" id="comment" role="tabpanel"
         aria-labelledby="comment-tab">
         <section class="replyList text-center">
            <div class="container" style="overflow-x:auto">
               <table class="table table-borderd"  style="text-align: center; table-layout: fixed">

                  <tbody>
<%   
   /*      for(ReplyDTO r : list) {
            out.println("<tr>");
            out.println("<td style='width: 5%'>"+r.getIdx()+"</td>");
            out.println("<td style='width: 75%'>"+r.getRepCom()+"</td>");
            out.println("<td style='width: 10%'>"+r.getBuyer_id()+"</td>");
            out.println("<td style='width: 10%'>"+r.getRepDate()+"</td>");
            out.println("</tr>");
         }*/
%>

                     <tr>
<%
   for(int i=1; i<=(countOfRows/10)+1; i++) {
   if(i!=numPage)
      out.println("<a href='ProductDetails_test2.jsp%page"+i+"' style='text-decoration:underline;'>" + i + "</a> ");
   else
      out.println("<span style='cursor:pointer;'>" + i + "</span>");
}
%>
                     </tr>
                     <tr>
                        <td colspan="4"><a href="ReplyWrite.jsp" class="btn btn-light float-right" type="submit">리뷰 작성</a></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </section>
      </div>
   </div>

</body>
<script type="text/javascript">
function insertBasket() {
    
   var a = $("#productquantity").val();
   document.form.action="ShopController?command=shopping_insertBasket&quantity="+a+"&idx=<jsp:getProperty name='details' property='idx'/>"
}
</script>
</html>