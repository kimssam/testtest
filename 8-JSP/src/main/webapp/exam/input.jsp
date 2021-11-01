<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function doSubmit() {	  
      if(!frm.num1.value || isNaN(frm.num1.value)){
         alert('첫 번째 칸 => 숫자를 입력해주세요');
         frm.num1.focus();
         frm.num1.value = "";
         return false;
      } else if(!frm.num2.value || isNaN(frm.num2.value)){
         alert('두 번째 칸 => 숫자를 입력해주세요');
         frm.num2.focus();
         frm.num2.value = "";
         return false;
      } 
      // 화면 이동
      if (confirm("계산하시겠습니까?")) {
      	frm.submit();
      }      
	}
</script>
</head>
<body>
<form action="result.jsp" method="post" name="frm">
	<table border="1">
    	<tr>
     		<td>첫 번째 수</td>  
     		<td><input type="text" name="num1"></td> 
   		</tr>
   		<tr>
   			<td>두 번째 수</td>
   			<td><input type="text" name="num2"></td>
   		</tr>
   		<tr>
   			<td colspan="2" align="center">
   				<input type="submit" value="계산" 
   						onclick="doSubmit(); return false;">
      			<input type="reset"  value="원래대로" >
   			</td>
   		</tr>
   </table>
</form>
</body>
</html>