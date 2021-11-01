<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript" src="../script/memberScript.js?v=3">
</script>
</head>
<body>
   <form action="../member/modify.jsp" name="modifyForm" method="post">
		<table border="1" width="440">
			<tr>
				<td align="center" width="70">이름</td>
				<td><input type="text" name="name" value="${dto.name}" readonly/></td>
			</tr>
			<tr>
				<td align="center">아이디</td>
				<td><input type="text" name="id" value="${dto.id}" readonly/></td>
			</tr>
			<tr align="center">
				<td>비밀번호</td>
				<td><input value="${dto.pwd}"
						type="password" name="pwd" size="50"></td>
			</tr>
			<tr align="center">
				<td>재확인</td>
				<td><input type="password" name="repwd" size="50"></td>
			</tr>
			<tr>
				<td align="center">성별</td>
				<td>
				<c:if test="${dto.gender == '남'}">
					<input type="radio" name="gender" value="남" checked="checked">남
					<input type="radio" name="gender" value="녀">녀
				</c:if>
				<c:if test="${dto.gender != '남'}">
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="녀" checked="checked">녀
				</c:if>				
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="text" size="10" value="${dto.email1}" name="email1">@
					<input type="text" value="${dto.email2}" name="email2" size="10">						
				</td>
			</tr>
			<tr>
				<td align="center">핸드폰</td>
				<td>
					<select name="tel1" style="width: 70px">
						<option>010</option>
						<option>011</option>
					</select>-
					<input value="${dto.tel2}" type="text" name="tel2" size="10">-
					<input value="${dto.tel3}" type="text" name="tel3" size="10">
				</td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td><input value="${dto.addr}"
				type="text" name="addr" size="50"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="checkModify()">
					<input type="reset" value="다시작성">
				</td>
			</tr>			
		</table>
	</form>
   <a href="../main/index.jsp">메인화면</a>

</body>
</html>