<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="../script/memberScript.js?v=2"></script>
</head>
<body>
	<form action="write.jsp" name="writeForm" method="post">
		<table border="1" width="440">
			<tr align="center">
				<td width="70">이름</td>
				<td><input type="text" name="name"  size="50"
							placeholder="이름 입력"></td>
			</tr>
			<tr >
				<td align="center">아이디</td>
				<td>
					<input type="text" name="id" size="37">
					<input type="button" value="중복체크" onclick="checkId()">
				</td>
			</tr>
			<tr align="center">
				<td>비밀번호</td>
				<td><input type="password" name="pwd" size="50"></td>
			</tr>
			<tr align="center">
				<td>재확인</td>
				<td><input type="password" name="repwd" size="50"></td>
			</tr>
			<tr>
				<td align="center">성별</td>
				<td>
					<input type="radio" name="gender" value="남" checked="checked">남
					<input type="radio" name="gender" value="녀">녀
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="text" name="email1">@
					<select name="email2" style="width:100px">
						<option>naver.com</option>
						<option>gmail.com</option>
						<option>hanamil.com</option>
						<option>daum.net</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">핸드폰</td>
				<td>
					<select name="tel1" style="width: 70px">
						<option>010</option>
						<option>011</option>
					</select>-
					<input type="text" name="tel2" size="10">-
					<input type="text" name="tel3" size="10">
				</td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td><input type="text" name="addr" size="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="회원가입" onclick="checkWrite()">
					<input type="reset" value="다시작성">
				</td>
			</tr>			
		</table>
	</form>
	<a href="../main/index.jsp">메인 화면</a>
</body>
</html>