<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
	border: 1px solid orange;
}
</style>
</head>
<body>
	<div align="center">
		<table width="500">
			<tr><th colspan="2"><h2>글 내용 상세보기</h2></th></tr>
			<tr>
				<td align="left">제목: ${bean.board_subject }</td>
				<td align="right">
					첨부파일: <a href="fileDown.do?downFile=${bean.board_file}">${bean.board_file }</a></td>
			</tr>
			<tr>
				<td bgcolor="orange" valign="top" align="center" height="300" colspan="2">
					<pre>${bean.board_content }</pre>
				</td>
			</tr>
		</table>
		<a href="boardReplyForm.do?board_num=${bean.board_num}&pg=${pg}">[답변]</a>
		<a href="boardModifyForm.do?board_num=${bean.board_num}&pg=${pg}">[수정]</a>
		<a href="boardDeleteForm.do?pg=${pg}&board_num=${bean.board_num}">[삭제]</a>
		<a href="boardList.do?pg=${pg }">[목록]</a>
	</div>
</body>
</html>