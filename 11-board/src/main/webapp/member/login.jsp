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
		
		response.sendRedirect("loginOk.jsp");
		
		/*
		// 1) 페이지 이동시 데이터 전송을 get방식으로 전송하면
		//    주소창에 표시되기 때문에 보안에 취약하다.
		//	  그래서, 보안에 관련된 데이터를 다른 페이지로 전송할 때는 쿠키 또는 세션을 이용한다.
		// 2) get방식으로 문자열을 전송할 때는 utf-8로 전송되기 때문에
		// 한글은 반드시 utf-8 엔코딩 설정을 해야함
		response.sendRedirect("loginOk.jsp?name=" 
						+ URLEncoder.encode(name, "utf-8") + "&id=" + id);
		*/
	} else {			// 로그인 실패
		response.sendRedirect("loginFail.jsp");
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