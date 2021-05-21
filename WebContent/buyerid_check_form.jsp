<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	var xhr = new XMLHttpRequest();
	var id;
	function onStart() {
		var id = opener.document.frm.id.value;
		$("#userId").val(id);		
	}
	function idCheck() {
		id = $("#userId").val();
		var param = "id="+id;
		//httpRequest = getXMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr.open("POST", "IdTestAction", true);
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(param);
	}
	function callback() {
		if(xhr.readyState == 4) {
			var resultText = xhr.responseText;
			//alert("응답받음 resultText: " + resultText);
			if(resultText==1) {
				$("#message").html("사용 가능한 아이디입니다.");
				$("#btnSend").attr('disabled', false);	
			} else if(resultText==0) {
				$("#message").html("사용 불가능한 아이디입니다.");
				$("#btnSend").attr('disabled', true);	// to be disabled.
			}
		}
	}
	function sendCheckValue() {
		opener.document.form1.id.value = id;
		opener.document.getElementById('id').disabled=false;
		self.close();
	}
</script>
</head>
<body onload="onStart()">
	<h4>아이디 중복체크</h4>
	<div id="checkDiv">
		<form name="checkForm">
			<input type="text" name="idInput" id="userId"/>
			<input type="button" value="중복확인" onclick="idCheck()"/>
		</form>
		<div id="message"></div>
		<br/>
		<input id="btnCancel" type="button" value="취소" onclick="window.close()"/>
		<input id="btnSend" type="button" value="아이디 사용" onclick="sendCheckValue()" DISABLED/>
	</div>
</body>
</html>