function check_id(checkId, what, message){ //id 정규식 확인 메서드 
	if(checkId.test(what.value)){
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	return false;
}
function check_pw(checkPw, what, message){ //pw 정규식 확인 메서드
	if(checkPw.test(what.value)){
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	return false;
}
function check_phone(checkPhone, what, message){ //phone 정규식 확인 메서드
	if(checkPhone.test(what.value)){
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	return false;
}




function check_seller_register(){ 
	
	//아이디 유효성 검사 
	var checkId = /^[0-9a-z]{4,12}$/; //id 정규식 : 숫자, 영어 소문자, 길이 4~12
	var id = document.getElementById("id");
	
	// 비밀번호 유효성 검사
	var checkPw = /^[a-zA-Z0-9]{4,12}$/; //pw 정규식: 영어 대소문자, 숫자 , 길이 4~12
	var pw = document.getElementById("pw");	
	var pw_ck = document.getElementById("pw_ck");
	
	//연락처 유효성 검사
	var checkPhone = /^[0-9]{11}$/; //phone 정규식:  숫자, 길이 11
	var phone = document.getElementById("phone");	
	

	
	//아이디 
	document.frm1.id.value = document.frm1.id.value.trim(); 
	if(document.frm1.id.value == ''){
		alert('아이디를 입력하지 않았습니다.');
		return false;
	}
	if(!check_id(checkId,id,"아이디는 영문, 숫자로만 입력가능합니다. 길이는 4~12로 정해주세요.")){
		return false;
	} 
	//아이디 중복체크
	if(document.frm1.id_duplicate.value != "id_checked"){
		alert('아이디 중복체크 해주세요.');
		return false;
	}
	
	//비밀번호 & 비밀번호 확인 
	document.frm1.pw.value = document.frm1.pw.value.trim();
	if(document.frm1.pw.value == ''){
		alert('비밀번호를 입력하지 않았습니다.');
		return false;
	}
	if(!check_pw(checkPw,pw,"비밀번호는 영문 대소문자, 숫자로만 입력가능하며 길이는 4~12로 정해주세요.")){
		return false;
	} 
	if(document.frm1.pw_ck.value == ''){
		alert('비밀번호 확인란을 입력해주세요.');
		return false;
	}
	if(pw.value != pw_ck.value){
		alert("비밀번호와 일치하지 않습니다. 동일하게 입력해주세요.");
		return false;
	}

	// 이름 
	document.frm1.name.value = document.frm1.name.value.trim();
	if(document.frm1.name.value == ''){
		alert('이름을 입력하지 않았습니다.');
		return false;
	}
	
	// 연락처
	document.frm1.phone.value = document.frm1.phone.value.trim();
	if(document.frm1.phone.value == ''){
		alert('연락처를 입력하지 않았습니다.');
		return false;
	}
	if(!check_phone(checkPhone,phone,"핸드폰 번호는 '-'없이 숫자 11개로 입력해주세요.'")){
		return false;
	} 
	return true;
	

} //check_seller_register() 닫기창

function open_id_check(){ //'중복체크' 클릭시 새창열기 
	window.name="parentFrom"; 
	window.open("seller_id_check.jsp" , "checkForm", "width=400, height=400");
}


