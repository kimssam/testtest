<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	ImageboardDAO dao = new ImageboardDAO();
	int result = dao.imageboardDelete(seq);
	
	request.setAttribute("pg", pg);
	request.setAttribute("result", result);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardDeleteResult");
	dispatcher.forward(request, response);
%>