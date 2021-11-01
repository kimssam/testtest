<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardDeletePro.do" method="post" id="deleteForm"
		  name="boardDeleteForm" >
		<input type="hidden" name="board_num" value="${param.board_num}">
		<input type="hidden" name="pg" value="${param.pg}">
		<table>
			<tr>
				<td>글 비밀번호</td>
				<td><input type="password" name="board_pass"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제">
					<input type="button" value="돌아가기" 
							onclick="history.back()">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>