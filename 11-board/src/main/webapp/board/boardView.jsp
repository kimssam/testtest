<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	// DB
	BoardDAO dao = new BoardDAO();
	// 조회수 증가
	dao.updateHit(seq);
	BoardDTO dto = dao.boardView(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="3"><font size="5"><%=dto.getSubject() %></font></td>
		</tr>
		<tr>
			<td width="150">글번호 : <%=dto.getSeq() %></td>
			<td width="150">작성자 : <%=dto.getName() %></td>
			<td width="150">조회수 : <%=dto.getHit() %></td>
		</tr>
		<tr>
			<td colspan="3" height="200" valign="top">
				<pre><%=dto.getContent() %></pre>
			</td>
		</tr>
	</table>
	
	<input type="button" value="목록" 
		   onclick="location.href='boardList.jsp?pg=<%=pg%>'">
<% if(session.getAttribute("memId").equals(dto.getId())) { // 로그인된 아이디와 글쓴이의 아이디가 일치할 때만 표시 %>
	<input type="button" value="글수정" 
		onclick="location.href='boardModifyForm.jsp?seq=<%=seq%>&pg=<%=pg%>'">
	<input type="button" value="글삭제" 
		onclick="location.href='boardDelete.jsp?seq=<%=seq%>&pg=<%=pg%>'">
<% } %>
</body>
</html>


