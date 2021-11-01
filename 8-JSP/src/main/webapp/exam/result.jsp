<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String str1 = request.getParameter("num1");
	String str2 = request.getParameter("num2");
	double num1 = Integer.parseInt(str1);
	double num2 = Integer.parseInt(str2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <p><%=num1 %>+<%=num2 %> = <%=num1 + num2 %></p>
   <p><%=num1 %>-<%=num2 %> = <%=num1 - num2 %></p>
   <p><%=num1 %>*<%=num2 %> = <%=num1 * num2 %></p>
   <p><%=num1 %>/<%=num2 %> = <%=num1 / num2 %></p>
</body>
</html>