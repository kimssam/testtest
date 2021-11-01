<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h3{text-align:center}
	.currentPaging {color: red; text-decoration: underline;}
	.paging {color: blue; text-decoration: none;}
</style>
</head>
<body>
	<h3>글 목록</h3>
	<table border="1" width="550" style="margin:auto;">
      <tr bgcolor="orange">
         <th width="70">번호</th>
         <th>제목</th>
         <th width="100">작성자</th>
         <th width="100">날짜</th>
         <th width="70">조회수</th>
      </tr>
      
   	 <c:forEach var="bean" items="${list}">
	      	<tr align="center">
	    		<td>${bean.board_num}</td>
				<td align="left">
					<c:if test="${bean.board_re_lev != 0}">
						<c:forEach var="i" begin="1" end="${bean.board_re_lev * 2}">
							&nbsp;
						</c:forEach>
						▶
					</c:if>
					<a href="boardView.do?pg=${pg}&board_num=${bean.board_num}">
						${bean.board_subject}</a>
				</td>
				<td>${bean.board_name}</td>
				<td>${bean.board_date}</td>
				<td>${bean.board_readcount}</td>
			</tr>	
	  </c:forEach>
   
   	<!-- 페이징 -->
   	<tr>
	  	<td colspan="5" align="center">
			<c:if test="${startPage > 3}">[<a class="paging" href="boardList.do?pg=${startPage-1}">이전</a>]</c:if>
			
	  		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${pg ==i}">
					[<a class="currentPaging" href="boardList.do?pg=${i}">${i}</a>]
				</c:if>
				<c:if test="${pg !=i }">
					[<a class="paging" href="boardList.do?pg=${i}">${i}</a>]
				</c:if>
			</c:forEach>
       		
       		<c:if test="${endPage < totalP}">[<a class="paging" href="boardList.do?pg=${endPage+1}">다음</a>]</c:if>
         </td>
	  </tr> 
   </table>
   <a href="index.jsp">메인화면</a>
   <a href="boardWriteForm.do">게시판 글쓰기</a>	
</body>
</html>