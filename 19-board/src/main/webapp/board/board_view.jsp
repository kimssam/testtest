<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#articleForm {
	width: 500px;
	height: 500px;
	border: 1px solid lightgray;
	margin: auto;
}
h2 {
	text-align: center;
}
#basicInfoArea {
	height: 40px;
	text-align: center;
}
#contentArea {
	background: orange;
	margin-top: 20px;
	height: 350px;
	text-align: center;
}
#commandList {
	margin: auto;
	text-align: center;
}
</style>
</head>
<body>
	<div id="articleForm">
		<h2>글 내용 상세보기</h2>
		<div id="basicInfoArea">		
			<p>제목 : ${bean.board_subject}</p>
			
			<c:if test="${bean.board_file != null}">
				<p>첨부파일 : <a href="fileDown.do?downFile=${bean.board_file}">${bean.board_file}</a></p>
			</c:if>
		</div>
		
		<div id="contentArea">
			<pre>${bean.board_content}</pre>
		</div>
		
		<div id="commandList">
			<a href="boardReplyForm.do?board_num=${bean.board_num}&pg=${pg}">[답변]</a>
			<a href="boardModifyForm.do?pg=${pg}&board_num=${bean.board_num}">
				[수정]</a>
			<a href="boardDeleteForm.do?board_num=${bean.board_num}&pg=${pg}">
				[삭제]</a> 
			<a href="boardList.do?pg=${pg}">[목록]</a>
		</div>
	</div>
</body>
</html>