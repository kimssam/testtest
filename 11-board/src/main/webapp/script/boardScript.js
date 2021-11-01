function checkBoardWrite() {
	if(!boardWriteForm.subject.value) {
      alert("제목을 입력해주세요");
      boardWriteForm.subject.focus();
   } else if(!boardWriteForm.content.value) {
      alert("내용을 입력해주세요");
      boardWriteForm.content.focus();
   } else {
      boardWriteForm.submit();
   }
}

function checkBoardModify() {
   if (!boardModifyForm.subject.value) {
      alert("제목을 입력하세요.");
      boardModifyForm.subject.focus();
      return false;
   } else if (!boardModifyForm.content.value) {
      alert("내용 입력하세요.");
      boardModifyForm.content.focus();
      return false;
   } else {
      boardModifyForm.submit();
   }
}