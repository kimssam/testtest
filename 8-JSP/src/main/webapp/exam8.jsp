<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function doSubmit() {
      if(!frm.num1.value){
         alert('첫 번째 칸 => 숫자를 입력해주세요');
         frm.num1.focus();
         return false;
      } else if(isNaN(frm.num1.value)){
            alert('첫 번째 칸 => 숫자로 입력해주세요');
            frm.num1.focus();
            frm.num1.value = "";
            return false;
      } else if(!frm.num2.value){
         alert('두 번째 칸 => 숫자를 입력해주세요');
         frm.num2.focus();
         return false;
      } else if(isNaN(frm.num2.value)){
            alert('두 번째 칸 => 숫자로 입력해주세요');
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
   <form action="exam8Pro.jsp" method="post" name="frm"
    	onsubmit="doSubmit(); return false">
   
	   <input type="text" name="num1">   
	   <select name="calc">
	      <option>+</option>
	      <option>-</option>
	      <option>*</option>
	      <option>/</option>
	      <option>%</option>
	   </select>
	   <input type="text" name="num2">
	   
	   <button type="submit" id="calc">계산</button>
      
   </form>
</body>
</html>