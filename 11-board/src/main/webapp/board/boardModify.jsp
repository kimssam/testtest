<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   request.setCharacterEncoding("utf-8");
	int seq = Integer.parseInt(request.getParameter("seq")); 
	int pg = Integer.parseInt(request.getParameter("pg")); 
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");   
   
   //DTO에 저장
   BoardDTO dto = new BoardDTO();
   dto.setSubject(subject);
   dto.setContent(content);
   dto.setSeq(seq);
   
   //DB
   BoardDAO dao = new BoardDAO();
   int su = dao.boardModify(dto);
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   window.onload = function() {
      if(<%=su > 0%>) {
         alert("글을 수정하였습니다.")
      } else {
         alert("글을 수정하지 못하였습니다.")
      }
      location.href="boardView.jsp?seq=<%=seq%>&pg=<%=pg%>";
   }
</script>
</head>
<body>

</body>
</html>