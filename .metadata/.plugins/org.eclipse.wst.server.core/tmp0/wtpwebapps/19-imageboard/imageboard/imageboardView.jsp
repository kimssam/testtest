<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	//DB
	ImageboardDAO dao = new ImageboardDAO();	
	ImageboardDTO dto = dao.boardView(seq);	
	
	// 화면 네비게이션
	// 공유데이터 저장
	request.setAttribute("pg", pg);
	request.setAttribute("dto", dto);
	
	// 화면 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardViewResult");
	dispatcher.forward(request,response);	
%>
