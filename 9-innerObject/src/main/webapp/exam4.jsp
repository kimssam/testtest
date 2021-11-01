<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";	
	out.println("출력되는 내용은 <b>" + name + "</b> 입니다요."); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>out 내장 객체 이용</h2>
	<% out.println("출력되는 내용은 <b>" + name + "</b> 입니다."); %>
	<hr>
	
	<h2>표현식 이용</h2>
	출력되는 내용은 <b><%=name %></b> 입니다.
</body>
</html>