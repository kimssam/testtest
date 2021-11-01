<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단.jyp</title>
</head>
<body>
	<table border="1">
<%	for(int y=1; y<=9; y++) {	// 1~9 %>
		<tr>
<%		for(int x=2; x<=9; x++) {		// 단 (2~9)  %>
			<td><%=x%>*<%=y%>=<%=x*y%></td>
<%		}  %>
		</tr>
<%	}	 %>
	</table>
<hr>
   <table border="1">
      <%for (int i=1; i<10; i++) {%>
         <tr>
         <%for (int j=2; j<10; j++) {%>
            <td><%=j + "*" + i + "=" + j*i%></td>
         <%}%>
         </tr>
      <%}%>
   </table>
</body>
</html>