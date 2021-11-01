<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100%;
}
#header {
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid lightgray;
}
#container {
	width: 100%;
	height: 500px;
	
}
#nav {
	width: 20%;
	height: 100%;
	background: orange;
	float: left;
}
#section {
	width: 80%;
	height: 100%;
	float: left;
}
#footer {
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid lightgray;
	clear: both;
}
#nav > h3 > a:link {color:black; text-decoration: none;}
#nav > h3 > a:visited {color:black; text-decoration: none;}
#nav > h3 > a:hover {color:green; text-decoration: underline;}
#nav > h3 > a:action {color:black; text-decoration: none;}
</style>
</head>
<body>
	<div id="header">
		<h1>게시판</h1>
	</div>
	
	<div id="container">
		<div id="nav">
			<h3><a href="index.jsp">* 메인화면 *</a></h3>
			<a href="boardWriteForm.do">게시판 글쓰기</a><br>
			<a href="boardList.do">게시판 목록</a><br>
		</div>
		
		<div id="section">
			<c:if test="${req == null}">
				<jsp:include page="body.jsp"/>
			</c:if>
			
			<c:if test="${req != null}">
				<jsp:include page="${req}"/>
			</c:if>
		
<%--		
			<c:if test="${param.req == 'boardWriteForm'}">
				<jsp:include page="board/boardWriteForm.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardList'}">
				<jsp:include page="board/boardList.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardView'}">
				<jsp:include page="board/boardView.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardDelete'}">
				<jsp:include page="board/boardDelete.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardDeletePro'}">
				<jsp:include page="board/boardDeletePro.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardModify'}">
				<jsp:include page="board/boardModify.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardModifyFail'}">
				<jsp:include page="board/boardModifyFail.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'boardReply'}">
				<jsp:include page="board/boardReply.jsp"/>
			</c:if>
 --%>
		</div>
	</div>
	
	<div id="footer">
		<p>EZEN IT ACADEMY</p>
	</div>
</body>
</html>