<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#modifyForm {
	width: 450px;
	height: 300px;
	border: 1px solid lightgray;
	margin: auto;
	padding-top: 10px;
}
h3 {
	text-align: center;
}
table {
	margin: auto;
	width: 400px;
	vertical-align: middle;
}
.td_left {
	width: 150px;
	background: lightblue;
	text-align: center;
}
.td_right {
	width: 300px;
	background: rgb(251, 254, 226);
}
input {
	border: 1px solid grey;
	background: none;
}
</style>
<script type="text/javascript">
	function modifyBoard() {
		var frm = document.boardModifyForm;
		if(!frm.board_pass.value) {
			alert("비밀번호를 입력하세요.");
			frm.board_pass.focus();
		} else if(!frm.board_subject.value) {
			alert("제목을 입력하세요.");
			frm.board_subject.focus();
		} else if(!frm.board_content.value) {
			alert("내용을 입력하세요.");
			frm.board_content.focus();
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>
	<h3>게시글 수정</h3>
	
	<form action="boardModifyPro.do" method="post" name="boardModifyForm" id="modifyForm">
		<input type="hidden" name="pg" value="${pg}">
		<input type="hidden" name="board_num" value="${board_num}">
		
		<div>
		<table>
			<tr>
				<td class="td_left">글쓴이</td>
				<td class="td_right"><input type="text" name="board_name" value="${bean.board_name}" size="41"></td>
			</tr>	
		
			<tr>
				<td class="td_left">비밀번호</td>
				<td class="td_right"><input type="password" name="board_pass" size="41"></td>
			</tr>	
		
			<tr>
				<td class="td_left">제목</td>
				<td class="td_right"><input type="text" name="board_subject" value="${bean.board_subject}" size="41"></td>
			</tr>	
		
			<tr>
				<td class="td_left">내용</td>
				<td class="td_right"><textarea rows="10" cols="38" name="board_content">${bean.board_content}</textarea></td>
			</tr>	
		</table>
		
		<br>
		<div align="center">
			<input type="button" value="수정" onclick="modifyBoard()">
			<input type="reset" value="뒤로" onClick="location.href='boardDetail.do?pg=${pg}&board_num=${board_num}'">
		</div>
		</div>
	</form>
	
</body>
</html>