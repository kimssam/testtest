<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더하기 결과</title>
</head>
<body>
   <h2>두수의 합 구하기</h2>
<%
   int a = Integer.parseInt(request.getParameter("a"));
   int b = Integer.parseInt(request.getParameter("b"));
   int sum = a + b;
%>
   <p><%=a%> + <%=b%> = <%=sum%></p>
</body>
</html>