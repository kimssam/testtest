<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(${su > 0}) {
			// 삭제 시 목록으로 이동		
			alert('삭제 성공');
			location.href = "boardList.do?pg=" + ${pg};
		} else {
			// 삭제 실패 시 view 화면으로 이동		
			alert('삭제 실패');		
			history.go(-2);		
		}
	}	
</script>
</head>
<body>

</body>
</html>