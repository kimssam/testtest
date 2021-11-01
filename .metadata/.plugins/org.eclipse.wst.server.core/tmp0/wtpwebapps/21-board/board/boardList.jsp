<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h2{
		text-align: center;
	}
	table{
		width:450px;
		margin: auto;
	}
	.ths{
		background: orange;
	}
	#subjectA:link{color:black; text-decoration: none;}
	#subjectA:visited{color:black; text-decoration: none;}
	#subjectA:hover{font-weight: bold; color:green; text-decoration: underline;}
	#subjectA:active{color:blue; text-decoration: none;}
	
	.paging{color: blue; text-decoration: none;}
	.currentPage{color: red; text-decoration: underline;}	
</style>
</head>
<body>
	<h2>글목록</h2>
	<table>
		<tr>
			<th class="ths">번호</th>
			<th class="ths">제목</th>
			<th class="ths">작성자</th>
			<th class="ths">날짜</th>
			<th class="ths">조회수</th>
		</tr>
		<c:forEach var="bean" items="${list }" >
			<tr align="center">
				<td>${ bean.board_num}</td>
				<td align="left">
					<c:if test="${bean.board_re_lev != 0 }">
						<c:forEach var="i" begin="1" end="${bean.board_re_lev*2 }">
							&nbsp;
						</c:forEach>
						►
					</c:if>
					<a id="subjectA" href="boardDetail.do?pg=${pg }&board_num=${bean.board_num }">
						${bean.board_subject}</a>
				</td>
				<td>${bean.board_name}</td>
				<td>${bean.board_date}</td>
				<td>${bean.board_readcount}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="center">
				<c:if test="${startPage > 3 }">
					[<a class="paging" href="boardList.do?pg=${startPage-1 }">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${pg == i }">
						[<a class="currentPage" href="boardList.do?pg=${i }">${i }</a>]
					</c:if>
					<c:if test="${pg != i }">
						[<a class="paging" href="boardList.do?pg=${i }">${i }</a>]
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					[<a class="paging" href="boardList.do?pg=${endPage+1 }">다음</a>]
				</c:if>
			</td>
		</tr>
	</table>
	<a href="index.jsp">메인메뉴</a>
</body>
</html>