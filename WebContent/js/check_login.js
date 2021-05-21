	//login_page.jsp 유효성체크
	function check_login(){
		document.frm2.id.value = document.frm2.id.value.trim();

		if(document.frm2.id.value == ''){
			alert('아이디를 입력해주세요!');
			return false;
		} 
		document.frm2.pw.value = document.frm2.pw.value.trim();
		if(document.frm2.pw.value == ''){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
		return true;
	}
	
	
	//phone 정규식 확인메서드(숫자만 11자리)
	function check_phone(checkPhone, what, message){ 
		if(checkPhone.test(what.value)){
			return true;
		}
		alert(message);
		what.value = "";
		what.focus();
		return false;
	}
	//search_id.jsp 유효성체크
	function check_search_id(){
		
		//연락처 유효성 검사
		var checkPhone = /^[0-9]{11}$/; //phone 정규식:  숫자, 길이 11
		var phone = document.getElementById("phone");
		
		
		document.frm2.name.value = document.frm2.name.value.trim();
		if(document.frm2.name.value == ''){
			alert('이름을 입력해주세요!');
			return false;
		}
		document.frm2.phone.value = document.frm2.phone.value.trim();
		if(document.frm2.phone.value == ''){
			alert('연락처를 입력해주세요!');
			return false;
		}
		if(!check_phone(checkPhone,phone,"핸드폰 번호는'-'없이 숫자 11개로 입력해주세요.'")){
			return false;
		} 
		//아래 false인경우 체크를 안한게됨.! buyer체크안하고 && seller도 체크 안했다면! 
		if(document.getElementById("buyer").checked == false && document.getElementById("seller").checked == false){ 
			alert('가입유형을 체크해주세요!');
			return false;
		}
		return true;

}
	

	
	

	