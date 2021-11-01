<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doSubmit() {	
	    if(!frm.hak.value){
	       alert('학번을 입력해주세요');
	       frm.hak.focus();
	       frm.hak.value = "";
	       return false;
	    }else if(isNaN(frm.hak.value)){
	        alert('숫자로 입력해주세요');
	        frm.hak.focus();
	        frm.hak.value = "";
	        return false;
	    }
	    if(!frm.name.value){
	      alert('이름을 입력해주세요.');
	      frm.name.focus();
	      return false;   
    	}
	    if(!frm.grade.value) {
	    	alert('학년을 선택해주세요.');
		    return false;
	    }
	    frm.submit();
	}  
</script>
</head>
<body>
<h2>학번, 이름, 학년, 선택과목을 입력하는 폼</h2>
<form action="exam1Pro.jsp" method="post" name="frm" 
		onsubmit="doSubmit(); return false">   
   <div>   
      <label>학번 :</label>
      <input type="text" name="hak"><br>
      <label>이름 :</label>
      <input type="text" name="name"><br>
      <label>학년 :</label>
      <input type="radio" name="grade" value="1학년">1학년
      <input type="radio" name="grade" value="2학년">2학년
      <input type="radio" name="grade" value="3학년">3학년
      <input type="radio" name="grade" value="4학년">4학년<br>   
   
      <label>선택과목 :</label>
         <select name="sub">
            <option>JSP</option>
            <option>CSS</option>
            <option>JAVA</option>
            <option>JS</option>
         </select><br>      
      <input type="submit" value="입력 완료">
   </div>   
</form>
</body>
</html>