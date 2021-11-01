<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서적관리프로그램</title>
<script type="text/javascript" src="script/bookScript.js"></script>
<style type="text/css">
	*{
	magin:0;
	padding:0;
	}
	
	h1{
	text-align:center;
	}
	
	table{
	width:800px;
	background-color:#a1dadc;
	border-collapse:collapse;
	border:none;
	margin:auto;
	}
	tr:nth-child(2) td input{
	width:100%;
	box-sizing:border-box;
	height:30px;
	}
</style>
</head>
<body>
	<form action="bookWritePro.do" name="writeForm" method="post" >
		<h1>도서 등록</h1>
		<table border="1">
			<tr>
				<th>도서코드</th>
				<th>도서명</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>출판일</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="serial">
				</td>
				<td>
					<input type="text" name="title">
				</td>
				<td>
					<input type="text" name="writer">
				</td>
				<td>
					<input type="text" name="publisher">
				</td>
				<td>
					<input type="text" name="cost">
				</td>
				<td>
					<input type="text" name="p_date">
				</td>
			</tr>
			<tr align="center">
				<td colspan="6">
					<input type="button" value="도서등록" onclick="checkForm()">
					<input type="reset" value="다시작성">
					<input type="button" value="도서목록 바로가기" onclick="location.href='bookList.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>