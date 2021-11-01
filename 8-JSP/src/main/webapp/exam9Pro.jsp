<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String result = "";
    boolean chk = false;  
    // 회원정보 확인
    // => 지금은 DB가 없기 때문에, 회원정보 확인 흉내만 내는 것임
    if(name.equals("root") && pwd.equals("1234")) {
    	result = "로그인에 성공했습니다.";
    	chk = true;  
    } else {
    	result = "아이디 또는 비밀번호가 잘못되었습니다.";
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(!<%= chk%>) {
			alert("아이디 또는 비밀번호가 잘못되었습니다.");
			history.back();
		}		
	}
</script>
</head>
<body>
   <p><%=result %></p>
</body>
</html>



