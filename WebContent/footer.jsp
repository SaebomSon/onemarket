<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOOTER</title>
<!--   
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css?after">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 -->

</head>
<style>
#line {
	height:3px;
	margin:0 auto;
	background: -webkit-linear-gradient(30deg, #fd6585, #0d25b9);
	color: transparent;
	border-radius:70px 20px;
	}
#t_i {
	line-height:46px;
	font-size:15px;
	font-weight:bold;
	letter-spacing:-1px;
	text-align:center;
}	
#i_l {
	line-height:15px; 
	font-size:20px;
}
#i_r {
	line-height:2px;
	font-size:16px;
	color:gray;
}
#img {
	cursor:pointer;
	text-align:center;
}
.b_i {
	padding-left:50px;
}



</style>
<body>
	<div class="container" style="width:100%;">
		<div class="row">
			<div class="col-1"></div>
			<p class="col-10" id="line"></p>
			<div class="col-1"></div>
		</div>
		<div class="row">
			
				<p class="col-3" id="t_i">회사소개</p>
				<p class="col-3" id="t_i">이용약관</p>
				<p class="col-3" id="t_i">개인정보처리방침</p>
				<p class="col-3" id="t_i" style="text-align:center">이용안내&nbsp;</p>
			
		</div>
		
		<hr width="80%;"><br/>
			
		<div class="row">
			<div class="col-2"></div>
			<div class="col-5">
				<p id="i_l">고객행복센터</p>
				<p id="i_l" style="font-size:40px; font-weight:bolder;">313-7300</p>
				<p id="i_l" style="font-size:15px;"><b>365고객센터</b> 오전9시-오후6시</p>
		
			</div>			
			<div class="col-5">
				<p id="i_r">법인명(상호) 주식회사 원마켓</p>
				<p id="i_r">사업자등록번호 325-88-00678</p>
				<p id="i_r">tel. 02-313-7300</p>
				<p id="i_r">fax. 02-313-0516</p>
				<p id="i_r">서울특별시 마포구 서강로136 아이비타워</p>
				<p id="i_r">통신판매업번호:2015-서울신촌-03148호</p>
			</div>	
			<div class="col-1"></div>
		</div>
		
		<hr width="80%;"><br/>
		
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
				<div class="b_i">
				<img src="img/bottom_instagram.png" onclick="window.open('https://www.instagram.com/')" target="_blank" id="img"/>
				<img src="img/bottom_facebook.png" onclick="window.open('https://www.facebook.com/')" target="_blank" id="img"/>
				<img src="img/bottom_blog.png" onclick="window.open('https://blog.naver.com')" target="_blank" id="img"/>
				<img src="img/bottom_youtube.png" onclick="window.open('https://www.youtube.com/')" target="_blank" id="img"/>
				</div>
			</div>
			<div class="col-4"></div>
		</div>
			
		
	
	
	
	
	
	</div>
</body>
</html>