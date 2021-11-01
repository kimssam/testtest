<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 데이터 꺼내기
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	// get 또는 post 방식일 경우
	//String name = request.getParameter("name");
	//String id = request.getParameter("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="" src="../image/tumi.png" width="30" height="30"
		onclick="location.href='../main/index.jsp'" style="cursor:pointer">
	<%=id + "(" + name + ")" %>님이 로그인
</body>
</html>