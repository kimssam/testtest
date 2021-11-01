function doSubmit(){
	if(frm.id.value==""){
		alert("아이디를 입력해 주세요");
		frm.id.focus();
		return false;
	}
	if(frm.pw.value==""){
		alert("비밀번호 입력해 주세요");
		frm.pw.focus();
		return false;
	}
	if(confirm("입력하신 내용이 맞습니까?")){
		frm.submit();
	}
}