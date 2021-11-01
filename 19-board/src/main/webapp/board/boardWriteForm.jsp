<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#registForm {
	width: 500px;
	height: 350px;
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
	<h2>게시판글등록</h2>
	<form action="boardWritePro.do" method="post" id="registForm"
			name="boardWriteForm" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="td_left">글쓴이</th>
				<td class="td_right"><input type="text" name="board_name" size="41"></td>
			</tr>
			<tr>
				<th class="td_left">비밀번호</th>
				<td class="td_right"><input type="password" name="board_pass" size="41"></td>
			</tr>
			<tr>
				<th class="td_left">제목</th>
				<td class="td_right"><input type="text" name="board_subject" size="41"></td>
			</tr>
			<tr>
				<th class="td_left">내용</th>
				<td><textarea rows="10" cols="40" name="board_content"></textarea></td>
			</tr>
			<tr>
				<th class="td_left">파일첨부</th>
				<td colspan="2" class="td_right"><input type="file" name="board_file" size="41"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록" >
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>