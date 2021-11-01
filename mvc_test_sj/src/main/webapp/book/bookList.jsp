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
		width:600px;
		margin: auto;
	}
	.ths{
		background: #a1dadc;
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
	<h2>도서목록</h2>
	<table>
		<tr>
			<th class="ths">도서코드</th>
			<th class="ths">도서명</th>
			<th class="ths">저자</th>
			<th class="ths">출판사</th>
			<th class="ths">가격</th>
			<th class="ths">출판일</th>
		</tr>
		<c:forEach var="dto" items="${list}" >
			<tr align="center">
				<td>${dto.serial}</td>
				<td>${dto.title}</td>
				<td>${dto.writer}</td>
				<td>${dto.publisher}</td>
				<td>${dto.cost}</td>
				<td>${dto.p_date}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5" align="center">
				<c:if test="${startPage > 3 }">
					[<a class="paging" href="bookList.do?pg=${startPage-1 }">이전</a>]
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${pg == i }">
						[<a class="currentPage" href="bookList.do?pg=${i }">${i }</a>]
					</c:if>
					<c:if test="${pg != i }">
						[<a class="paging" href="bookList.do?pg=${i }">${i }</a>]
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					[<a class="paging" href="bookList.do?pg=${endPage+1 }">다음</a>]
				</c:if>
			</td>
		</tr>
	</table>
	<a href="index.jsp">메인메뉴</a>
</body>
</html>