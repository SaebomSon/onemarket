<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css?after">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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


<title>Insert title here</title>

<style>
   #logoHeader a {
      text-decoration:none !important;
   }

   #logoHeader a:hover {
      text-decoration:none !important;
   }
   #head {
       background: -webkit-linear-gradient(30deg, #fd6585, #0d25b9);
       color: transparent;
       -webkit-background-clip: text;
       font-size: 60px;
       font-family : TmonMonsori, "GodoB";
       cursor: pointer;  
       font-weight:bold;
       letter-spacing:-1px;
       padding:20px;
       margin:auto;
       margin-bottom:1px;
       text-align:center;
          
      }
      /*
   .container { 
      width:800px;
      }
      */
   .box {

      height:15px;
      background: -webkit-linear-gradient(30deg, #fd6585, #0d25b9);
       color: transparent;
       border-radius:70px 20px;
       margin:auto;
      }   
   .navbar {
      color:purple;
   }   
   #dropdownMenuLink { 
      width:160px;
      height:38px;
      padding-top:9px;
      border:1px solid purple;
      color:purple;

      }
   #dropdownMenuLink:hover {
      background-color:purple important!;
      }      
   .dropdown-item {
      text-align:center;
      color:purple;
      font-size:14px;
      border-radius:20px;
      padding:5px;
      margin-left:10px;
      width:140px;
      }   
   .dropdown-item:hover {
      background:purple;
      color:white;
      }   
   .dropdown-menu {
       margin-top: 0px;
   }   
   #inputsearch {
      width:500px;
      border:1px solid purple;
      }   
   #btn {
      color:purple;
      border:1px solid purple;
      }
   #btn:hover {
      background-color:purple;
      color:white;
      }
   #btn_container {
      width:750px;
      margin-top:10px;
   }   


</style>




</head>

<body onload="init();">

   <!-- <div style="padding: 10px;"
    class="jumbotron bg-white text-center text-white">
    -->
   <div class="container">
      <div class="row">
         <div class="col-2"></div>
         <div class="col-8" id="logoHeader"> 
            <a href="ShopController?command=shopping_main"><h1 id="head">ONE MARKET</h1></a>
         </div>
         <div class="col-2"></div>
      </div>
      <div class="row">
         <div class="col-2"></div>
         <div class="col-8">
            <h1 class="box"></h1>
         </div>
         <div class="col-2"></div>
      </div>
   </div>
   <!-- 
   <div style="padding: 10px 5px 5px 5px;"
      class="jumbotron bg-white text-center text-purple">
 -->

      <div class="container" id="btn_container">
      <div class="row">
         <!-- <nav class="navbar" id="usermenu"> -->

         <div class="col-6" style="color:purple;">
            <% if(session.getAttribute("userid")!=null){
                  out.println(session.getAttribute("userid")+"님, 환영합니다! "); %>
                  
            <a class="btn btn-outline-warning btn-rounded btn-sm my-0" 
               href="ShopController?command=logout" id="btn" >로그아웃</a>
         </div>
         <% if("소비자".equals((String) session.getAttribute("usertype"))){ %>
         <div class="col-2">
         <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ShopController?command=show_orderlist" id="btn">주문내역</a>
               </div><%} %>
         <div class="col-2" style="padding-left:0px;">   
            <% if("소비자".equals((String) session.getAttribute("usertype"))){ %>
            
            <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ShopController?command=shopping_basket" id="btn">장바구니</a>
               <% }
                  if("판매자".equals((String) session.getAttribute("usertype"))){ %>
            <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ProductInsert.jsp" id="btn">제품등록</a>
         </div>
         <div class="col-2" style="padding-left:0px;">
            <a class="btn btn-outline-warning btn-rounded btn-sm my-0" href="ShopController?command=seller_products" id="btn">판매목록</a>
                     <%
                  }
               }else{
                  %>
               <a class="btn btn-outline-warning btn-rounded btn-sm my-0" id="btn" href="login_page.jsp">로그인</a>
               <a class="btn btn-outline-warning btn-rounded btn-sm my-0" id="btn"  href="choose_register.jsp">회원가입</a>
                  <%
               }%>
         </div>
      </div> <!-- 상단 버튼 row닫기 -->   
                     

            <!-- <nav class="navbar" id="usermenu" style="width:500px;"> -->

      <div class="row" style="margin-top:10px;">
         <div class="col-3">
            <div class="d-inline dropdown show" >
               <a
               class="btn btn-rounded btn-sm my-0 dropdown-toggle"
               href="#" role="button" id="dropdownMenuLink"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
               카테고리 </a>

               <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="font-color:purple">
                  <a class="dropdown-item" id="Category"
                     href="ShopController?command=search_category&Category=exercise">운동</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=cook">요리용품</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=cosmetic">화장품</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=menclothing">남성의류</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=food">음식</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=refinement">교양</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=goods">잡화</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=fashion">패션</a>
                  <a class="dropdown-item"
                     href="ShopController?command=search_category&Category=etc">기타</a>
               </div>
            </div>
         </div> 
            
         <div class="col-6" style="padding-right:0px;">
            <form class="form-inline my-2 my-lg-0" action="ShopController" >
               <input class="form-control mr-sm-2" type="text" name="Search" style="color:purple;"
                  required="required" placeholder="Search" aria-label="Search" id="inputsearch">
         </div>
         <div class="col-1" style="padding-left:0px; margin-top:5;">
               <input class="btn btn-rounded btn-sm my-0" style="width:38pt; padding-top:2px;"
                  name="command" value="search" type="submit" src="img/searchIcon.png" id="btn">
            </form>
         </div>   
         
        </div> <!-- 하단버튼 row닫기 -->

<!-- </nav> --> 
            
</div>  <!-- 버튼 컨테이너  닫기-->


   <div class="row">
      <div class="col-12">
         <hr>
      </div>
   </div>
   
</body>
</html>