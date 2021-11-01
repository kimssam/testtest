<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>if - else</title>
<style type="text/css">
form{
	border: 1px solid lightgray;
	padding: 5px;
}
div {
	margin: 5px;
}
</style>
</head>
<body>
	<form action="exam4Pro.jsp" method="post">
		<div>
			<label>이름 : </label>
			<input type="text" name="name">
		</div>
		<div>
			<label>나이 : </label>
			<input type="text" name="age">
		</div>
		<div>
			<input type="submit" value="입력완료">
			<input type="reset" value="다시작성">
		</div>
	</form>
</body>
</html>