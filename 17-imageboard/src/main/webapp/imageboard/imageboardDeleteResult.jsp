<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		삭제에 성공하였습니다.<br>
	</c:if>
	<c:if test="${result <= 0 }">
		삭제에 실패하였습니다.<br>
	</c:if>
	<input type="button" value="목록"
		onclick="location.href = '../imageboard/imageboardList.jsp?pg=${pg }'">
</body>
</html>