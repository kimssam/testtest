window.onload = function(){
		var frm = document.writeForm;
		frm.serial.focus();
}
function checkForm(){
	var frm = document.writeForm;
	if(!frm.serial.value){
		alert("도서코드는 필수입력항목입니다");
		frm.serial.focus();
	}else if(!frm.title.value){
		alert("도서명은 필수입력항목입니다");
		frm.title.focus();
	}else if(!frm.writer.value){
		alert("저자는 필수입력항목입니다");
		frm.writer.focus();
	}else{
		frm.submit();
	}
}


