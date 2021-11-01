<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 410px;
	border: 1px solid lightgray;
	margin: auto;
}
h2 {
	text-align: center;
}
table {
	margin: auto;
	width: 450px;
}
.td_left {
	width: 150px;
	background: orange;
	text-align: center;
}
.td_right {
	width: 300px;
	background: skyblue;
}
#commandCell {
	text-align: center;
}
</style>
</head>
<body>
	<h2>게시판 답글 등록</h2>
	<form action="boardReplyPro.do" method="post" name="boardForm"
			id="registForm">
		<input type="hidden" name="pg" value="${pg}">
		<input type="hidden" name="board_num" value="${bean.board_num}">
		<input type="hidden" name="board_re_ref" value="${bean.board_re_ref}">
		<input type="hidden" name="board_re_lev" value="${bean.board_re_lev}">
		<input type="hidden" name="board_re_seq" value="${bean.board_re_seq}">
		
		<table>
			<tr>
				<td class="td_left">글쓴이</td>
				<td class="td_right">
					<input type="text" name="board_name">
				</td>
			</tr>
			<tr>
				<td class="td_left">비밀번호</td>
				<td class="td_right">
					<input type="password" name="board_pass">
				</td>
			</tr>
			<tr>
				<td class="td_left">제 목</td>
				<td class="td_right">
					<input type="text" name="board_subject">
				</td>
			</tr>
			<tr>
				<td class="td_left">내 용</td>
				<td class="td_right">
					<textarea rows="15" cols="40" name="board_content"></textarea>
				</td>
			</tr>
		</table>
		
		<div id="commandCell">
			<input type="submit" value="답변글 등록">
			<input type="reset" value="다시 작성">
		</div>
	</form>
</body>
</html>