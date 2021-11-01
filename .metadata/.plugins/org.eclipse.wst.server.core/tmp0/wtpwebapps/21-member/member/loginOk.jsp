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
	<img alt="" src="image/tumi.png" width="30" height="30"
		onclick="location.href='index.jsp'" style="cursor:pointer">
	${memId}(${memName})님이 로그인되었습니다. <br> 
	<a href="index.jsp">홈으로</a>
</body>
</html>