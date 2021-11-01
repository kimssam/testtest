<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   request.setCharacterEncoding("UTF-8");

   int region = Integer.parseInt(request.getParameter("region"));
   String regionName = "";
   
   switch (region) {
   case 0: 
      regionName = "용산, 강남";
      break;
   case 1: 
      regionName = "도봉, 신사, 잠실";
      break;
   case 2: 
      regionName = "강동, 동대문";
      break;
   case 3: 
      regionName = "노원, 송파";
      break;
   case 4: 
      regionName = "은평, 서대문";
      break;
   case 5: 
      regionName = "구로, 영등포";
      break;
   case 6: 
      regionName = "종로, 강북";
      break;
   default: 
      regionName = "없는 구역입니다.";
   }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화(결과)</title>
</head>
<body>
   <p>선택하신 지역은 <b><%=regionName %></b> 입니다.</p>
</body>
</html>