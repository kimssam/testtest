<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터 읽기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// DB
	MemberDAO dao = new MemberDAO();
	String name = dao.login(id, pwd);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(name != null) { %>
		<%=name %>님이 로그인
	<% } else { %>
		아이디 또는 비밀번호가 틀렸으니 다시 로그인 하세요.<br>
		<a href="loginForm.jsp">로그인</a>
	<% } %>
</body>
</html>