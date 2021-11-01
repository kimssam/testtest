<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화</title>

<script type="text/javascript">
function doSubmit() {
   var frm = document.frm;

   // 라디오 검사
   if (!frm.region.value) {
      alert("권역이 선택되지 않았습니다.\n다시 입력해주시기 바랍니다.");
      frm.region[0].focus();
      return false;
   }
   
   // 제출 시 화면이동 검사
   if (confirm("해당 지역으로 제출됩니다.\n계속 진행 하시겠습니까?")) {
      frm.submit();
   }
}

</script>

</head>
<body>
   <form action="/8-JSP/exam7Pro.jsp" method="get" name="frm" 
   		onsubmit="doSubmit(); return false;">
   
      <h1>다음 중 권역을 선택하세요.</h1>
      <br>
      <div>
         <div><input type="radio" name="region" value="0">0 권역</div>
         <div><input type="radio" name="region" value="1">1 권역</div>
         <div><input type="radio" name="region" value="2">2 권역</div>
         <div><input type="radio" name="region" value="3">3 권역</div>
         <div><input type="radio" name="region" value="4">4 권역</div>
         <div><input type="radio" name="region" value="5">5 권역</div>
         <div><input type="radio" name="region" value="6">6 권역</div>
      </div>
      
      <div>
         <input type="submit" value="제출하기">
      </div>
   </form>
</body>
</html>