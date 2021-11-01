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
	height: 400px;
	border: 1px solid lightgray;
	margin: auto;
}
h2 {
	text-align: center;
}
table {
	width: 450px;
	margin: auto;
}
.td_left {
	width: 150px;
	background: orange;
}
.td_right {
	width: 300px;
	background: skyblue;
}
</style>
</head>
<body>
	<div>
		<h2>게시판 글 등록</h2>
		<form action="boardWritePro.do" method="post" id="registForm" 
				name="boardWriteForm" enctype="multipart/form-data">
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
						<textarea name="board_content" rows="10" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td class="td_left">파일 첨부</td>
					<td class="td_right">
						<input type="file" name="board_file">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>			
		</form>
	</div>
</body>
</html>