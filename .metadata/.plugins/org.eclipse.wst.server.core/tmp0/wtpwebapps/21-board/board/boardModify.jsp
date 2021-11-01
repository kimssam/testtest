<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<style type="text/css">
#frm {
	width: 550px;
	height: 460px;
	border: 1px solid lightgray;
	margin: auto;
}
table{
	width: 500px;
	margin: auto;
}
.th_left {
	width: 120px;
	background: orange;
}
.td_right {
	background-color: skyblue;	
}
</style>
<script type="text/javascript">
	function modifyBoard() {
		var frm = document.boardModifyForm;
		if(!frm.board_pass.value){
			alert("비밀번호를 입력하세요.");
			frm.board_pass.focus();
		} else if(!frm.board_subject.value){
			alert("제목을 입력하세요.");
			frm.board_subject.focus();
		} else if(!frm.board_content.value){
			alert("내용을 입력하세요.");
			frm.board_content.focus();
		} else{
			frm.submit();
		}
	}
</script>
</head>
<body>
	<form action="boardModifyPro.do" method="post" 
	 name="boardModifyForm" id="modifyForm">
		<input type="hidden" name="board_num" value="${bean.board_num}">
		<input type="hidden" name="pg" value="${pg}">
		<table>
			<tr align="center">
				<td colspan="2"><h2>게시판 글 수정</h2></td>
			</tr>
			<tr>
				<th class="th_left">글쓴이</th>
				<td class="td_right"><input type="text" name="board_name" 
				value="${bean.board_name }" size="53"></td>
			</tr>
			<tr>
				<th class="th_left">비밀번호</th>
				<td class="td_right"><input type="password" name="board_pass" size="53"></td>
			</tr>
			<tr>
				<th class="th_left">제목</th>
				<td class="td_right"><input type="text" name="board_subject"
				value="${bean.board_subject }" size="53"></td>
			</tr>
			<tr>
				<th class="th_left">내용</th>
				<td><textarea name="board_content" rows="15" 
				cols="55">${bean.board_content }</textarea></td>
			</tr>
			<tr align="center">
				<td colspan="2">
				<input type="button" value="수정" onclick="modifyBoard()">
				<input type="reset" value="다시작성">
				<input type="button" value="뒤로" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>