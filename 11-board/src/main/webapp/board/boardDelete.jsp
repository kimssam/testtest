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
   int su = dao.delete(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<script type="text/javascript">
	window.onload = function() {
		if(<%=su > 0%>) {
			alert("게시글이 삭제되었습니다.");
			location.href="boardList.jsp?pg=<%=pg%>"
		} else {
			alert("게시글을 삭제하지 못하였습니다.");
			history.back();
		}
	}	
</script>
</head>
<body>
<%--
<% if(su>0) { %>
   <p>게시글이 삭제되었습니다.</p>
<% } else { %>
	<p>게시글을 삭제하지 못하였습니다.</p>
<% } %>
   <br>
   <a href="boardList.jsp?pg=<%=pg%>">목록으로</a>
 --%>
</body>
</html>