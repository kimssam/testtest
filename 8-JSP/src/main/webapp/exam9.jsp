<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function doSubmit() {
    if(!frm.name.value) {
          alert('아이디를 입력해주세요.');
          frm.name.focus();
          return false;
       }
    if(!frm.pwd.value) {
        alert('비밀번호를 입력해주세요.');
        frm.pwd.focus();
        frm.pwd.value = "";
        return false;
     }
    if(confirm("로그인 하시겠습니까?")){       
       frm.submit();
    }
}
</script>
</head>
<body>
   <h1>회원 인증 화면</h1>
   <form action="exam9Pro.jsp" method="get"
        onsubmit="doSubmit(); return false;" name="frm">
	   <div>
	      <label>ID:</label>
	      <input type=text name="name"><br>
	      <label>PW:</label>
	      <input type="password" name="pwd">
	   </div>
	   <input type="submit" value="확인">
   </form>
</body>
</html>