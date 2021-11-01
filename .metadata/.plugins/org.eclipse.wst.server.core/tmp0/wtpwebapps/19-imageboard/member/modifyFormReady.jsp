<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	
	// DB
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.memberView(id);
	
	// 화면 네비게이션
	// 1. 공유데이터 저장	
	request.setAttribute("dto", dto);
	
	// 2. 화면이동 : forward 방식
	RequestDispatcher dispatcher = 
		request.getRequestDispatcher("../main/index.jsp?req=modifyForm");
	dispatcher.forward(request, response);	
%> 