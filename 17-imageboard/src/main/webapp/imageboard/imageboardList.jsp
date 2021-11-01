<%@page import="java.util.List"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int pg = 1;
	if(request.getParameter("pg") != null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	
	// DB
	// 1페이지당 목록 5개씩
	int endNum = pg*5;
	int startNum = endNum-4;
	
	ImageboardDAO dao = new ImageboardDAO();
	List<ImageboardDTO> list = dao.imageboardList(startNum, endNum);
	
	//페이징 : 3블럭
	int totalA = dao.getTotalA(); // 총 데이터의 갯수, 10
	int totalP = (totalA + 4)/5;  // 총 페이지 수, 4
	
	if(pg>totalP) pg = totalP;	// pg 수정	
	
	int startPage=(pg-1)/3*3+1; //1
	int endPage=startPage+2; //3
	if(endPage > totalP) {
		endPage = totalP;
	}
	
	// 화면 네비게이션
	// 1. 공유데이터 저장
	request.setAttribute("list", list);
	request.setAttribute("pg", pg);
	request.setAttribute("totalP", totalP);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	
	// 2. 화면이동 : forward 방식
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardListResult");
	dispatcher.forward(request, response);	
%>
