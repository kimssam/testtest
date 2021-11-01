<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적관리프로그램</title>
<style type="text/css">
	*{
	magin:0;
	padding:0;
	}
	html,body{
	width:100%;
	height:100%;
	position:absolute;
	}
	h1{
	text-align:center;
	}
	form{
	width:800px;
	height:150px;
	position:absolute;
	top:10%;
	marin-top:-75px;
	left:50%;
	margin-left:-400px;
	}
	table{
	background-color:linen;
	width:100%;
	height:100%;
	border-collapse:collapse;
	border:none;
	}
	tr:nth-child(2) td input{
	width:100%;
	box-sizing:border-box;
	height:40px;
	}
</style>
<script type="text/javascript">
	window.onload = function(){
		var frm = document.writeForm;
		frm.id.focus();
	}
	function checkForm(){
		var frm = document.writeForm;
		if(!frm.id.value){
			alert("학번을 입력하세요");
			frm.id.focus();
		}else if(!frm.name.value){
			alert("이름을 입력하세요");
			frm.name.focus();
		}else if(!frm.korean.value){
			alert("국어점수를 입력하세요");
			frm.korean.focus();
		}else if(!frm.english.value){
			alert("영어점수를 입력하세요");
			frm.english.focus();
		}else if(!frm.math.value){
			alert("수학점수를 입력하세요");
			frm.math.focus();
		}else{
			frm.submit();
		}
	}
	
</script>
</head>
<body>
	<form action="scoreWrite.jsp?pg=1" name="writeForm" method="post" >
		<h1>::성적관리 프로그램::</h1>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="id">
				</td>
				<td>
					<input type="text" name="name">
				</td>
				<td>
					<input type="text" name="korean">
				</td>
				<td>
					<input type="text" name="english">
				</td>
				<td>
					<input type="text" name="math">
				</td>
			</tr>
			<tr align="center">
				<td colspan="5">
					<input type="button" value="성적입력" onclick="checkForm()">
					<input type="reset" value="다시작성">
					<input type="button" value="학생성적목록 바로가기" onclick="location.href='scoreList.jsp?pg=1'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>