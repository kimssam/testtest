<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터
	int pg = Integer.parseInt(request.getParameter("pg"));
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	// DB
	ImageboardDAO dao = new ImageboardDAO();
	ImageboardDTO dto = dao.boardView(seq);
	
	// 화면 네비게이션
	// 1. 공유데이터 저장
	request.setAttribute("dto", dto);
	request.setAttribute("pg", pg);
	request.setAttribute("seq", seq);
	// 2. 화면이동 : forward 방식
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyForm");
	dispatcher.forward(request, response);
%>
