<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	// 목록 보기 : 5개씩 목록 출력
	int endNum = pg * 5;	
	int startNum = endNum - 4;
	
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.selectList(startNum, endNum);

	// 페이징 처리 : 숫자를 3블럭으로 표시
	int totalA= dao.getTotalMember();   // 총회원수
	int totalP= (totalA + 4) / 5;		// 총 페이주
		
	int startPage = (pg-1)/3*3+1;
	int endPage = startPage + 2;
	if(endPage>totalP) endPage = totalP;		
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging{color:blue; text-decoration: none; }
.currentPaging{color:red; text-decoration: underline; font-size: 1.2em;}
</style>
</head>
<body>
	<table border="1" width = "800" style="margin: auto;">
		<tr bgcolor="orange" height="50">
			<th width="120">이 름</th>
			<th width="170">아이디</th>
			<th width="50">성별</th>
			<th width="180">이메일</th>
			<th width="150">전화번호</th>
			<th width="130">가입일</th>																		
		</tr>
		
	<% for(MemberDTO dto : list) { %>
		<tr align="center" bgcolor="#ffffcc" height="50">
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getEmail1() %>@<%=dto.getEmail2() %> </td>
			<td><%=dto.getTel1() %>-<%=dto.getTel2() %>-<%=dto.getTel3() %></td>
			<td><%=dto.getLogtime() %></td>		
		</tr>
	<% } %>
		<tr>
			<td colspan="6" align="center" height="25">
			<% if(startPage > 3) { %>
				[<a class="paging" href="memberList.jsp?pg=<%=startPage-1%>">이전</a>]
			<% } %>
				
			<% for(int i=startPage; i<=endPage; i++) { %>
				<% if(pg==i)  { %>
				[<a class = "currentPaging" href="memberList.jsp?pg=<%=i %>"><%=i %></a>]
				<% } else { %>
					[<a class="paging" href="memberList.jsp?pg=<%=i %>"><%=i %></a>]
				<% } %>
			<% } %> 	
			
			<% if(endPage <totalP) { %>
				[<a class="paging" href="memberList.jsp?pg=<%=endPage+1%>">다음</a>]
			<% } %> 	
			</td>
		</tr>			
	</table><br>
	
	<a href="../main/index.jsp">메인화면</a>
</body>
</html>