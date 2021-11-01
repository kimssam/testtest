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
	<table border="1" width="510">
		<tr >
			<td rowspan="4" width="210">
				<img alt="이미지" src="../storage/${dto.image1 }" width="200" height="200">
			</td>
			<td height="50">상품명 : ${dto.imageName }</td>
		</tr>
		<tr height="50">
			<td >단가 : ${dto.imagePrice }</td>
		</tr>
		<tr height="50">
			<td >개수 : ${dto.imageQty }</td>
		</tr>
		<tr height="50">
			<td >합계 : ${dto.imagePrice*dto.imageQty }</td>
		</tr>
		<tr height="200">
			<td colspan="2" valign="top">
				<pre>${dto.imageContent }</pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록"
			onclick="location.href='../imageboard/imageboardList.jsp?pg=${pg}'">
	<input type="button" value="삭제"
		onclick="location.href = '../imageboard/imageboardDelete.jsp?seq=${dto.seq}&pg=${pg}'">
	<input type="button" value="수정"
		onclick="location.href = '../imageboard/imageboardModifyFormReady.jsp?pg=${pg}&seq=${dto.seq}'">
</body>
</html>