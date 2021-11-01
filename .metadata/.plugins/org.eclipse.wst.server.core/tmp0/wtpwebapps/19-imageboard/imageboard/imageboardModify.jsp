<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String realFolder = request.getServletContext().getRealPath("/storage");
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
			5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	
	int seq = Integer.parseInt(multi.getParameter("seq"));
	int pg = Integer.parseInt(multi.getParameter("pg"));
	String imageId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");
	System.out.println("image1 = " + image1);
	  	
	//DTO에 저장
	ImageboardDTO dto = new ImageboardDTO();
	dto.setSeq(seq);
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	
	// DB
	ImageboardDAO dao = new ImageboardDAO();
	int su = dao.imageboardModify(dto);
   
	// 화면 네비게이션
	// 1. 공유데이터 저장
	request.setAttribute("pg", pg);
	request.setAttribute("seq", seq);
	request.setAttribute("su", su);
	
	// 2. 화면이동 : forward 방식
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyResult");
	dispatcher.forward(request, response);
%>     