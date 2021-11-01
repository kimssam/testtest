<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식으로 데이터가 전송될 때는 반드시 한글처리를 해주어야함
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String result = "";
	
	if (age >= 20) result = "이상";
	else result = "이하";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if - else</title>
</head>
<body>
	<p><%=name %> 님의 나이는 20세 <%=result %>입니다.</p>
</body>
</html>