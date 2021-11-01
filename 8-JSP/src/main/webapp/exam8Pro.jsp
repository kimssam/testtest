<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String num1 = request.getParameter("num1");
   String calc = request.getParameter("calc");
   String num2 = request.getParameter("num2");
   
   double number1 = Double.parseDouble(num1);
   double number2 = Double.parseDouble(num2);
   double result = 0;
   
   switch(calc){
   case "+" : result = number1 + number2; break;
   case "-" : result = number1 - number2; break;
   case "*" : result = number1 * number2; break;
   case "/" : result = number1 / number2; break;
   case "%" : result = number1 % number2; break;
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <p><%=num1 %> <%=calc %> <%=num2 %> = <%=result %></p>
</body>
</html>