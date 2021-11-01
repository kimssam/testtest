<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/boardScript.js?v=1"></script>
</head>
<body>
   <form action="boardWrite.jsp" method="post" name="boardWriteForm">
      <table border="1" width="400">
         <tr>
            <th width="50">제목</th>
            <td><input type="text" name="subject" size="47"></td>
         </tr>
         <tr>
            <th>내용</td>
            <td><textarea name="content" rows="15" cols="45"></textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="button" value="글쓰기" onclick="checkBoardWrite()">
               <input type="reset" value="다시 작성">
            </td>
         <tr>
      </table>
   </form>
   <a href="../main/index.jsp">메인 화면</a>
</body>
</html>