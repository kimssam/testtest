<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener 객체 : 현재 브라우저 기준 부모 브라우저를 관리하는 객체
		opener.writeForm.id.value = "${id}";
		window.close();  // 열려있는 브라우저 닫기
		opener.writeForm.pwd.focus();
	}
</script>
</head>
<body>
	<form action="memberCheckId.do" method="post">
		<c:if test="${exist == true}">
			${id}는 사용중입니다.<br><br>
			아이디 <input type="text" name="id">
			<input type="submit" value="중복 체크">
		</c:if>
		
		<c:if test="${exist == false}">
			${id}는 사용 가능합니다.<br><br>
			<input type="button" value="사용" onclick="checkIdClose()">
		</c:if>		
	</form>
</body>
</html>