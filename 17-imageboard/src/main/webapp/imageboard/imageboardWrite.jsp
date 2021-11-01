<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 데이터 처리
	// 저장 폴더 위치 구하기
	String realFolder = request.getServletContext().getRealPath("/storage");
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 
			5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	String imageId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");
	
	// DB
	ImageboardDTO dto = new ImageboardDTO();
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	
	ImageboardDAO dao = new ImageboardDAO();
	int su = dao.imageboardWrite(dto);
	
	// 화면 네비게이션
	// 1. 공유데이터 저장
	request.setAttribute("su", su);
	request.setAttribute("imageName", imageName);
	// 2. 화면이동 : forward 방식
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardWriteResult");
	dispatcher.forward(request, response);
%>    



