<%@page import="java.net.URLEncoder"%>
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
	
	// 페이지 이동
	if(name != null) {	// 로그인 성공
		// 공유데이터를 세션에 저장하고 페이지 이동
		session.setAttribute("memName", name);
		session.setAttribute("memId", id);	
		
		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("../main/index.jsp?req=loginOk");
		dispatcher.forward(request, response);		
	} else {			// 로그인 실패
		RequestDispatcher dispatcher = 
			request.getRequestDispatcher("../main/index.jsp?req=loginFail");
		dispatcher.forward(request, response);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	<% if(name != null) { %>
		<%=name %>님이 로그인
	<% } else { %>
		아이디 또는 비밀번호가 틀렸으니 다시 로그인 하세요.<br>
		<a href="loginForm.jsp">로그인</a>
	<% } %>
 --%>
</body>
</html>