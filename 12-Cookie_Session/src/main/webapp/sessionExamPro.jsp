<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	// 세션에 데이터 저장
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>세션 속성 설정 및 사용</h3>
	<p>id와 pwd를 세션에 저장하였습니다.</p>
	<p>세션에 저장된 값 확인</p>
	id = <%=session.getAttribute("id") %>,
	pwd = <%=session.getAttribute("pwd") %>
</body>
</html>