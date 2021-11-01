<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 요청</title>
<script type="text/javascript">
   function doSubmit() {
      if(!frm.name.value) {
            alert('이름을 입력해주세요');
            frm.name.focus();
            return false;
         }
      
      if(!frm.kor.value || isNaN(frm.kor.value)) {
            alert('국어점수를 입력해주세요');
            frm.kor.focus();
            frm.kor.value = "";
            return false;
         }
      
      if(!frm.eng.value || isNaN(frm.eng.value)) {
            alert('영어점수를 입력해주세요');
            frm.eng.focus();
            frm.eng.value = "";
            return false;
         }
      
      if(!frm.math.value || isNaN(frm.math.value)) {
            alert('수학점수를 입력해주세요');
            frm.math.focus();
            frm.math.value = "";
            return false;
         }
      
      // 화면 이동
      frm.submit();
   }
</script>
</head>
<body>
    <h2>성적처리 요청</h2>
    <form action="exam5Pro.jsp" name="frm" onsubmit="doSubmit(); return false;">
        이름 : <input type="text" name="name"><br>
        국어 : <input type="text" name="kor"><br>
        영어 : <input type="text" name="eng"><br>
        수학 : <input type="text" name="math"><br>
        <input type="submit" value="성적처리 계산">
    </form>
</body>
</html>