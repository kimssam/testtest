<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="org.apache.coyote.http11.filters.BufferedInputFilter"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	// 파일이 저장된 실제 폴더위치 구하기
	String realPath = request.getServletContext().getRealPath("/storage");
	// 다운받고자 하는 파일
	File file = new File(realPath, fileName);
	System.out.println("file = " + file);
	
	// 기존 jsp의 객체 out의 스트림을 지우고 출력해야, 예외발생이 안생김
	out.clear();
	out = pageContext.pushBody();
	
	// HDD에 저장된 파일을 RAM으로 읽어옴
	FileInputStream fis = new FileInputStream(file);
	BufferedInputStream bis = new BufferedInputStream(fis);
	byte[] b = new byte[(int)file.length()];
	bis.read(b, 0, b.length);  // bis.read(배열명, 배열시작위치, 배열의 크기)
	bis.close();
	fis.close();
	
	// 클라이언트로 전송
	// => "파일 다운로드" 형태로 전송
	// => 파일 정보를 Header에 저장해서 클라이언트로 전송
	// => 파일이름과 파일크기 
	response.setHeader("Content-Disposition", "attachment; fileName=" + URLEncoder.encode(fileName, "UTF-8"));
	response.setHeader("Content-Length", String.valueOf(file.length()));
	
	ServletOutputStream sos = response.getOutputStream();
	BufferedOutputStream bos = new BufferedOutputStream(sos);
	bos.write(b);
	bos.close();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
