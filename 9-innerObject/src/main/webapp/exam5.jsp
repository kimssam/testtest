<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String info = application.getServerInfo();
	String path = application.getRealPath("");   // 웹프로젝트 저장 위치 확인
	application.log("로그기록 : " + info);			  // 콘솔창에 문자열 출력
	System.out.println("로그기록 : " + info);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>application 내장 객체</h3>
	<p>웹 컨테이터의 이름과 버전 : <%=info %></p>
	<p>웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path %></p>
</body>
</html>