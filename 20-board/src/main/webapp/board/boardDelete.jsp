<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
<style type="text/css">
.boardDeleteForm {
	width: 300px;
	height: 100px;
	border: 1px solid orange;
	margin: auto;
	text-align: center;
	line-height: 50px;
}
</style>
<script type="text/javascript">
	function doDelete() {
		var frm = document.boardDeleteForm;
		
		if(!frm.board_pass.value) {
	      alert("비밀번호를 입력해주세요");
	      frm.board_pass.focus();
	   } else {
		  if(confirm("내용을 삭제하시겠습니까?")) {
			  frm.submit();
		  };		  
	   }
	}
</script>


</head>
<body>
	<form action="boardDeletePro.do" method="post" class="boardDeleteForm"
		name="boardDeleteForm" onsubmit="doDelete(); return false;">

		<!-- 리턴 값 숨김처리 -->
		<input type="hidden" name="pg" value="${param.pg}">
		<input type="hidden" name="board_num" value="${param.board_num}">

		<!-- 비밀번호 입력 -->
		<span>글 비밀번호 : </span> 
		<input type="password" name="board_pass">

		<!-- 버튼 -->
		<div id="btn">
			<input type="submit" value="삭   제">
			<input type="button" value="돌아가기" 	onclick="history.back()">
		</div>
	</form>
</body>
</html>