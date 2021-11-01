<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script type="text/javascript">
	window.onload = function() {
		if (${su > 0}) {
			alert("수정 성공");
		} else {
			alert("수정 실패");
		}		
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>

</body>
</html>