<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th width="120">표현식</th>
			<th width="120">값</th>
			<th width="120">jsp 표현식</th>
		</tr>
		<tr>
			<td>\${25+36}</td>
			<td>${25+36}</td>
			<td><%=25+36%></td>
		</tr>
		<tr>
			<td>\${25/6}</td>
			<td>${25/6}</td>
			<td><%=25/6%></td>
		</tr>
		<tr>
			<td>\${25%6}</td>
			<td>${25%6}</td>
			<td><%=25%6 %></td>
		</tr>
		<tr>
			<td>\${25>36}</td>
			<td>${25>36}</td>
			<td><%=25>36%></td>
		</tr>
		<tr>
			<td>\${header.host}</td>
			<td>${header.host}</td>
			<td><%=request.getHeader("host") %></td>
		</tr>		
	</table>
</body>
</html>