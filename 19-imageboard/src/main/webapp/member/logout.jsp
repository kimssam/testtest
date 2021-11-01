<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 삭제
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
	// 무효화 : 모두 지우기
	session.invalidate();
	
	// 화면 이동
	RequestDispatcher dispatcher = 
			request.getRequestDispatcher("../main/index.jsp?req=logoutResult");
	dispatcher.forward(request, response);
%>    
