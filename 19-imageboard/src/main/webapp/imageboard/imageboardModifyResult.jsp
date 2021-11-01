<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 수정 완료</title>
<script type="text/javascript">
	window.onload = function() {
		if(${su > 0 }) {
			alert("이미지 게시글이 수정되었습니다.");
		} else {
			alert("이미지 게시글을 수정하지 못하였습니다.")
		}
		
		location.href="../imageboard/imageboardView.jsp?pg=${pg}&seq=${seq}"
	}
</script>
</head>
<body>
<%--
	<c:if test="${su > 0 }">
		<p>이미지 게시글이 수정되었습니다.</p>
		<a href="../imageboard/imageboardView.jsp?pg=${pg}&seq=${seq}">목록으로</a>
	</c:if>
		<c:if test="${su > 0 }">
		<p>이미지 게시글을 수정하지 못하였습니다.</p>
		<a href="history.back()">뒤로</a>
	</c:if>
 --%>
</body>
</html>