<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	// DB
	MemberDAO dao = new MemberDAO();
	boolean exist = dao.isExistId(id);
	
	// 화면 네비게이션
	// 1. 공유데이터 저장
	request.setAttribute("id", id);
	request.setAttribute("exist", exist);	
		
	// 2. 화면이동 : forward 방식
	RequestDispatcher dispatcher = 
			request.getRequestDispatcher("checkIdResult.jsp");
	dispatcher.forward(request, response);
%>    
