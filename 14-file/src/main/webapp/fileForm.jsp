<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일</title>
</head>
<body>
	<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th width="50">제목</th>
				<td><input type="text" name="subject" size="47"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="15" cols="45"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="upload1" size="47"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="upload2" size="47"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="파일업로드">
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>