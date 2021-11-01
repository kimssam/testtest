<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터 처리
	request.setCharacterEncoding("utf-8"); // 한글 인코딩 코드
	String name = request.getParameter("name");
	String PNfront = request.getParameter("PNfront");
	String PNmid = request.getParameter("PNmid");
	String PNback = request.getParameter("PNback");
	
	switch(PNfront){
		case "서울" : PNfront = "02" ; break;
		case "부산" : PNfront = "051"; break;
		case "대구" : PNfront = "053"; break;
		case "인천" : PNfront = "032"; break;
		case "광주" : PNfront = "062"; break;
		case "대전" : PNfront = "042"; break;
		case "울산" : PNfront = "052"; break;
		case "세종" : PNfront = "044"; break;
		case "경기" : PNfront = "031"; break;
		case "강원" : PNfront = "033"; break;
		case "충북" : PNfront = "043"; break;
		case "충남" : PNfront = "041"; break;
		case "전북" : PNfront = "063"; break;
		case "전남" : PNfront = "061"; break;
		case "경북" : PNfront = "054"; break;
		case "경남" : PNfront = "055"; break;
		case "제주" : PNfront = "064"; break;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=name %>님의 전화번호는 <%=PNfront %>-<%=PNmid %>-<%=PNback %>입니다.</p>
</body>
</html>