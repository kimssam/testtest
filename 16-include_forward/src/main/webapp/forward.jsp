<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("apple", "사과");

	// <jsp:forward> 동일한 자바 클래스
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");
	dispatcher.forward(request, response);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	<jsp:forward page="forwardResult.jsp"/>
	 --%>
</body>
</html>