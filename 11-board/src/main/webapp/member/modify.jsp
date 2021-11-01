<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 데이터
   request.setCharacterEncoding("utf-8");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String gender = request.getParameter("gender");
   String email1 = request.getParameter("email1");
   String email2 = request.getParameter("email2");
   String tel1 = request.getParameter("tel1");
   String tel2 = request.getParameter("tel2");
   String tel3 = request.getParameter("tel3");
   String addr = request.getParameter("addr"); 
   
   // DTO에 저장
   MemberDTO dto = new MemberDTO();  
   dto.setId(id);
   dto.setPwd(pwd);
   dto.setGender(gender);
   dto.setEmail1(email1);
   dto.setEmail2(email2);
   dto.setTel1(tel1);
   dto.setTel2(tel2);
   dto.setTel3(tel3);
   dto.setAddr(addr);
   
   // DB
   MemberDAO dao = new MemberDAO();
   int su = dao.modify(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 확인</title>
<script type="text/javascript">
   window.onload = function() {
      if(<%=su > 0%>) {
         alert("회원정보를 수정 완료했습니다.");
         location.href="../main/index.jsp"
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