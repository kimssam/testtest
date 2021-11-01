<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //double x = Double.valueOf(request.getParameter("x"));
   //double y = Double.valueOf(request.getParameter("y"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>${param.x} + ${param.y } = ${param.x + param.y }</p>
	<p>${param.x} - ${param.y } = ${param.x - param.y }</p>
	<p>${param.x} * ${param.y } = ${param.x * param.y }</p>
	<p>${param.x} / ${param.y } = ${param.x / param.y }</p>
<%--
   <p><%=x%> + <%=y%> = <%=x+y%></p>
   <p><%=x%> - <%=y%> = <%=x-y%></p>
   <p><%=x%> * <%=y%> = <%=x*y%></p>
   <p><%=x%> / <%=y%> = <%=x/y%></p>
 --%>
</body>
</html>