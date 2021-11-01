<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 확인</title>
<script type="text/javascript">
   window.onload = function() {
      if(${su > 0}) {
         alert("회원정보를 수정 완료했습니다.");
         location.href="index.jsp"
      } else {
         alert("회원정보를 수정하지 못했습니다.");
         history.back();
      }
   }
</script>
</head>
<body>
</body>
</html>