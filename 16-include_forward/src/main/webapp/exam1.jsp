<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "고길동";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>** include 지시자 **</h3>
	<%@ include file="today.jsp" %> <!-- jsp 파일 자체로 포함 -->
	
	<h3>** jsp include **</h3>
	<jsp:include page="image.jsp"/> <!-- 최종 HTML 문서를 포함 -->
	
	<div>exam1.jsp, name=<%=name %></div>
</body>
</html>