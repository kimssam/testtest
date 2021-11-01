<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String name = "";
	String value = "";
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				name = cookies[i].getName();
				value = cookies[i].getValue();
			}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>웹브라우저에 저장된 쿠키를 가져오는 페이지</h3>
	<p> 쿠키의 이름은 "<%=name %>" 이고,</p>
	<p> 쿠키의 값은 "<%=value %>" 입니다.</p>
</body>
</html>