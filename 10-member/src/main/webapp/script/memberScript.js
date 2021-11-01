function checkWrite() {
	if(!writeForm.name.value) {
		alert("이름을 입력하세요");
		writeForm.name.focus();
	} else if(!writeForm.id.value) {
		alert("아이디를 입력하세요");
		writeForm.id.focus();
	} else if(!writeForm.pwd.value) {
		alert("비밀번호를 입력하세요");
		writeForm.pwd.focus();
	} else if(writeForm.pwd.value != writeForm.repwd.value) {
		alert("비밀번호가 맞지 않습니다.");
		writeForm.repwd.focus();
	} else {
		writeForm.submit();
	}
}

function ckeckLogin() {
	if(!loginForm.id.value) {
		alert("아이디를 입력하세요");
		loginForm.id.focus();
	} else if(!loginForm.pwd.value) {
		alert("비밀번호를 입력하세요");
		loginForm.pwd.focus();
	} else {
		loginForm.submit();
	}
}

function checkId() {
	var sId = writeForm.id.value;
	
	if(sId == "") {
		alert("먼저 아이디를 입력하세요.");
	} else {
		window.open("checkId.jsp?id=" + sId, "", "width=450 height=100 left=500 top=200")
	}
}






