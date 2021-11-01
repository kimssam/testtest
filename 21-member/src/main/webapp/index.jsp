<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 게시판</title>
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
			<a href="index.jsp">
				<h3>** 메인 화면 **</h3>
			</a>
			<!-- 로그인 전/후 화면 분리 -->
			<c:if test="${memId == null}">  <!-- 로그인 전 -->
				<a href="writeForm.do">회원가입</a><br>
				<a href="loginForm.do">로그인</a><br>
			</c:if>
			
			<c:if test="${memId != null}">	<!-- 로그인 후 -->
				<a href="logout.do">로그아웃</a><br>
				<a href="modifyForm.do">회원정보수정</a><br>
				<a href="memberList.do?pg=1">회원목록보기</a><br>
				<a href="deleteForm.do">회원탈퇴</a><br>
			</c:if>		
		</div>
		
		<div id="section">
			<c:if test="${req == null}">
				<jsp:include page="body.jsp"/>
			</c:if>
			
			<c:if test="${req != null}">
				<jsp:include page="${req}"/>
			</c:if>
		</div>
	</div>
	<div id="footer">
		<p>SJ BANK</p>
	</div>			
</body>
</html>