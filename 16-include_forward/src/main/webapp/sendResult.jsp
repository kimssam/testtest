<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결과 : <%=request.getAttribute("apple") %><br>
결과 : <%=pageContext.getAttribute("apple") %><br>
결과 : <%=session.getAttribute("apple") %><br>
결과 : <%=application.getAttribute("apple") %><br>
</body>
</html>