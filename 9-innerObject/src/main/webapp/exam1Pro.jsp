<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<% 
   request.setCharacterEncoding("utf-8");
   String hak = request.getParameter("hak");
   String name = request.getParameter("name");
   String grade = request.getParameter("grade");
   String sub = request.getParameter("sub");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>학생 정보</h2>
   <table border="1">
        <tr align="center">
           <td width="50px">학번</td>
           <td width="120px"><%=hak%></td>
        </tr>
        <tr align="center">
           <td>이름</td>
           <td><%=name%></td>
        </tr>
        <tr align="center">
           <td>학년</td>
           <td><%=grade%></td>
        </tr>
        <tr align="center">
           <td>과목</td>
           <td><%=sub%></td>
        </tr>
   </table>
   <hr>
   
   <h3>request 객체의 기본 함수들</h3>
   클라이언트 IP = <%= request.getRemoteAddr() %><br>
   요청정보 길이 = <%= request.getContentLength() %><br>
   요청정보 인코딩 = <%= request.getCharacterEncoding() %><br>
   요청정보 컨텐트타입 = <%= request.getContentType() %><br>
   요청정보 프로토콜 = <%= request.getProtocol() %><br>
   요청정보 전송방식 = <%= request.getMethod() %><br>
   요청 URI = <%= request.getRequestURI() %><br>
   요청 URL = <%= request.getRequestURL() %><br>
   컨텍스트 경로 = <%= request.getContextPath() %><br>
   서버 이름 = <%= request.getServerName() %><br>
   서버 포트 = <%= request.getServerPort() %><br>
   <hr>
   <h3>Header 정보 확인</h3>
   <%
   		Enumeration header = request.getHeaderNames();
   		while( header.hasMoreElements()) {
   			String headerName = (String) header.nextElement();
   			String headerValue = request.getHeader(headerName);
   	%>
   		<%=headerName %> = <%=headerValue %><br>
   <%
   		}
   %>
</body>
</html>















