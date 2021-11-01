<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터
	int pg = Integer.parseInt(request.getParameter("pg"));

	/* 페이징 */
	// => 한페이지당 목록 5개인 경우 : 총페이지수 = (총글수+4)/5
	// 총글수 : 12
	// 총페이지 수 : 3     (12+4)/5 
	
	// 총글수 : 23
	// 총페이지 수 : 5		(23+4)/5
	
	// 총글수 : 25
	// 총페이지 수 : 5		(25+4)/5
	BoardDAO dao = new BoardDAO();
	int totalA = dao.getTotalA();	// 총글수
	int totalP = (totalA + 4) / 5;	// 총페이지수
	
	if(pg > totalP) pg = totalP; 
	
	// 3블럭으로 페이지 표시
	// 총페이지 수 : 8
	//		 [1][2][3][다음]
	//	[이전][4][5][6][다음]
	//	[이전][7][8]
	// startPage 계산 결과
	// pg=1 : (1-1)/3*3+1 => 1
	// pg=2 : (2-1)/3*3+1 => 1
	// pg=3 : (3-1)/3*3+1 => 1
	// pg=4 : (4-1)/3*3+1 => 4
	int startPage = (pg-1)/3*3+1;
	int endPage = startPage + 2;
	if(endPage>totalP) endPage = totalP;

	/* DB */
	// 1페이지당 5개씩
	// pg=1 : rn>=1 and rn<=5
	// pg=2 : rn>=6 and rn<=10
	// pg=3 : rn>=11 and rn<=15
	
	int endNum = pg*5;
	int startNum = endNum - 4;	
	//System.out.println(pg + ", " + startNum + ", " + endNum);	
	List<BoardDTO> list = dao.boardList(startNum, endNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 로그인 되어 있는 지 검사해서, 상세보기로 이동함
	function isLogin(seq) {
		<% if(session.getAttribute("memId") == null) { %>
			alert("먼저 로그인 하세요");
		<% } else { %>
			location.href = "boardView.jsp?seq=" + seq + "&pg=" + <%=pg%>;
		<% } %>
	}
</script>
<style type="text/css">
#subjectA:link {color:black; text-decoration: none;}
#subjectA:visited {color:black; text-decoration: none;}
#subjectA:hover {color:green; text-decoration: underline;}
#subjectA:active {color:black; text-decoration: none;}

.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: underline;}
</style>
</head>
<body>
	<table border="1" width="550" style="margin:auto;">
		<tr bgcolor="orange">
			<th width="70">글번호</th>
			<th>제목</th>
			<th width="100">작성자</th>
			<th width="100">작성일</th>
			<th width="70">조회수</th>
		</tr>
		
	<% for(BoardDTO dto : list) { %>
		<tr align="center" bgcolor="#ffffcc">
			<td><%=dto.getSeq() %></td>
			<td><a id="subjectA" href="#" onclick="isLogin(<%=dto.getSeq()%>)">
					<%=dto.getSubject() %></a></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getLogtime() %></td>
			<td><%=dto.getHit() %></td>
		</tr>
	<% } %>
		
		<!-- 페이징 -->
		<tr>
			<td colspan="5" align="center">
			<% if(startPage > 3) { %>
				[<a class="paging" href="boardList.jsp?pg=<%=startPage-1%>">이전</a>]
			<% } %>
				
			<% for(int i=startPage; i<=endPage; i++) { %>	
				<% if(pg==i) { %>
					[<a class="currentPaging" href="boardList.jsp?pg=<%=i%>"><%=i %></a>]
				<% } else { %>
					[<a class="paging" href="boardList.jsp?pg=<%=i%>"><%=i %></a>]
				<% } %>
			<% } %>
			
			<% if(endPage < totalP) { %>
				[<a class="paging" href="boardList.jsp?pg=<%=endPage+1%>">다음</a>]
			<% } %>
			</td>
		</tr>
	</table>
	
	<% if(session.getAttribute("memId") == null) { // 로그아웃상태 %>
		<a href="../member/loginForm.jsp">로그인</a>
	<% } else {  // 로그인 상태%>
		<a href="boardWriteForm.jsp">글쓰기</a>
	<% } %>
</body>
</html>

<%-- 일반 for문
	<% for(int i=0; i<list.size(); i++) {
			BoardDTO dto = list.get(i);
	%>
		<tr align="center">
			<td><%=dto.getSeq() %></td>
			<td><%=dto.getSubject() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getLogtime() %></td>
			<td><%=dto.getHit() %></td>
		</tr>
	<% } %>	
 --%>





