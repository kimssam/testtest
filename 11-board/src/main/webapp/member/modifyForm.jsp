<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 데이터
   String id = (String)session.getAttribute("memId");

   // DB
   MemberDAO dao = new MemberDAO();   
   // 회원정보 불러오기
   MemberDTO dto = dao.memberView(id); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript" src="../script/memberScript.js?v=3">
</script>
</head>
<body>
   <form action="modify.jsp" name="modifyForm" method="post"  onsubmit="checkModify();return false;">
      <table border="1" width="450">
         <tr>
            <td width="70">이름</td>
            <td><input type="text" name="name" value="<%=dto.getName()%>" readonly/></td>      
         </tr>      
         <tr>
            <td>아이디</td>
            <td><input type="text" name="id" value="<%=dto.getId()%>" readonly/></td>      
         </tr>      
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pwd" value="<%=dto.getPwd()%>"></td>      
         </tr>      
         <tr>
            <td>재확인</td>
            <td><input type="password" name="repwd" value="<%=dto.getPwd()%>"></td>      
         </tr>      
         <tr>
            <td>성별</td>
            <td>
            <% if(dto.getGender().equals("남")) { %>
               <input type="radio" name="gender" value="남" checked="checked">남
               <input type="radio" name="gender" value="여">여
            <% } else { %>
               <input type="radio" name="gender" value="남">남
               <input type="radio" name="gender" value="여" ch>여
            <% } %>
            </td>      
         </tr>      
         <tr>
            <td>이메일</td>
            <td>
               <input type="text" name="email1" value="<%=dto.getEmail1()%>">@
               <input type="text" name="email2" value="<%=dto.getEmail2()%>">
            </td>      
         </tr>      
         <tr>
            <td>핸드폰</td>
            <td>
               <input type="text" name="tel1" size="10" value="<%=dto.getTel1()%>">-
               <input type="text" name="tel2" size="10" value="<%=dto.getTel2()%>">-
               <input type="text" name="tel3" size="10" value="<%=dto.getTel3()%>">
            </td>      
         </tr>      
         <tr>
            <td>주소</td>
            <td><input type="text" name="addr" size="50" value="<%=dto.getAddr()%>"></td>      
         </tr>      
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="수정 완료">
               <input type="reset" value="다시 작성">
            </td>
      </table>
   </form>
   <a href="../main/index.jsp">메인화면</a>

</body>
</html>