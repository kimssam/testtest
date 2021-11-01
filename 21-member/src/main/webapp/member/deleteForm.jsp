<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkPass() {
		if(!deleteForm.id.value) {
			alert("아이디를 입력해주십시오.");
			deleteForm.id.focus();
		} else if(!deleteForm.pwd.value){
			alert("비밀번호를 입력해주십시오.");
			deleteForm.pwd.focus();
		} else {
			if(confirm("탈퇴하시겠습니까?")) {
				deleteForm.submit();
			}
		}	
	}	
</script>
<style type="text/css">
#article_form {
	width: 250px;
	height: 120px;
	margin: auto;
	border: 3px solid #81BEF7;
}
#id_area{
	margin-top: 15px;
	text-align: center; 
}
#pwd_area{
	margin-top: 5px;
	text-align: center; 
}
label {
	display: inline-block;
	width: 75px;
	text-align: right;
}
#command_area{
	text-align: center;
	margin-top: 15px;
}
</style>
</head>
<body>
	<div id="article_form">
		<form action="delete.do" name="deleteForm">	
			<div id="id_area">
				<label for="id">아이디 : </label>
				<input type="text" name="id" size="15">
			</div>
			<div id="pwd_area">
				<label for="pwd">비밀번호 : </label>
				<input type="password" name="pwd" size="15">
			</div>
			<div id="command_area">
				<input type="button" value="삭제" onclick="checkPass()">
				<input type="button" value="돌아가기" onclick="history.back()">
			</div>
		</form>
	</div>
</body>
</html>