<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doSubmit() {
		var name = frm.name.value;
		var PNfront = frm.PNfront.value;
		var PNmid = frm.PNmid.value;
		var PNback = frm.PNback.value;
		
		if(!frm.name.value){
			alert("이름을 입력해주세요.");
			frm.name.focus();
			return false;
		}
		var pattern = /^[가-힣]*$/; // 처음부터 끝까지 전부 한글로 된것만 true, 아니면 false
		for(var i=0; i<name.length; i++){
			if(name.charAt(i) != " " && pattern.test(name.charAt(i))==false){
				alert("이름란에는 문자를 입력해주세요.");
				frm.name.focus();
				frm.name.value = "";
				return false;
			}
		}
		if(frm.PNfront.selectedIndex < 1){
			alert("지역번호를 선택해주세요.");
			frm.PNfront.focus();
			return false;
		}
		if(!frm.PNmid.value){
			alert("번호를 입력해주세요.");
			frm.PNmid.focus();
			return false;
		}
		if(isNaN(frm.PNmid.value)){
			alert("전화번호란에는 숫자만 입력해주세요.");
			frm.PNmid.focus();
			frm.PNmid.value = "";
			return false;
		}
		if(frm.PNmid.value.length < 3){
			alert("번호를 다시 입력해주세요.");
			frm.PNmid.focus();
			return false;
		}
		if(!frm.PNback.value){
			alert("번호를 입력해주세요.");
			frm.PNback.focus();
			return false;
		}
		if(isNaN(frm.PNback.value)){
			alert("전화번호란에는 숫자만 입력해주세요.");
			frm.PNback.focus();
			frm.PNback.value = "";
			return false;
		}
		if(frm.PNback.value.length < 4){
			alert("번호를 다시 입력해주세요.");
			frm.PNback.focus();
			return false;
		}
		if(confirm("입력하신 내용을 확인해주세요.\n" 
				+ "이름 : " + name + "\n전화번호 : " +PNfront+") "+PNmid+"-"+PNback)){
			frm.submit();
		}else{
			if(confirm("다시입력하시겠습니까?")){
				location.reload();
			}
		}
	}
</script>
<style type="text/css">
 .PN{
 	width: 40px;
 }
</style>
</head>
<body>
	<h2>이름과 전화번호를 입력하세요</h2>
	<form name="frm" action="exam6Pro.jsp" method="post">
		<label>이름 : </label>
			<input type="text" name="name">
		<br>
		<div>
			<label>전화번호 : </label>
				<select name="PNfront">
					<option>-선택-</option>
					<option>서울</option>
					<option>부산</option>
					<option>대구</option>
					<option>인천</option>
					<option>광주</option>
					<option>대전</option>
					<option>울산</option>
					<option>세종</option>
					<option>경기</option>
					<option>강원</option>
					<option>충북</option>
					<option>충남</option>
					<option>전북</option>
					<option>전남</option>
					<option>경북</option>
					<option>경남</option>
					<option>제주</option>
				</select>
				-<input class="PN" type="text" name="PNmid" maxlength="4">
				-<input class="PN" type="text" name="PNback" maxlength="4">
		</div>
			
		<div>
			<input type="submit" value="제출" onclick="doSubmit(); return false;">
			<input type="reset" value="다시 작성">
		</div>
	</form>
</body>
</html>