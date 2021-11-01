<%@page import="score.dao.ScoreDAO"%>
<%@page import="score.dto.ScoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//데이터 읽기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int korean = Integer.parseInt(request.getParameter("korean"));
	int english = Integer.parseInt(request.getParameter("english"));
	int math = Integer.parseInt(request.getParameter("math"));
	 
	
	//DTO에 저장
	ScoreDTO dto = new ScoreDTO();
	dto.setName(name);
	dto.setId(id);
	dto.setKorean(korean);
	dto.setEnglish(english);
	dto.setMath(math);
	
	//DB
	ScoreDAO dao = new ScoreDAO();
	int su = dao.scoreWrite(dto);
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적목록</title>

<script type="text/javascript">
window.onload = function(){
	if(<%= su > 0 %>){
		alert("성적이 정상적으로 등록되었습니다");
		location.href="scoreList.jsp?pg=1";
	}else{
		alert("성적등록이 실패하였습니다");
		history.back();
	}
	
}
</script>
</head>
<body>
	
</body>
</html>