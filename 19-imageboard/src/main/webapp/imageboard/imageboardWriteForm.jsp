<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록</title>
<script type="text/javascript">
function checkImageBoardWrite() {
	if(!imageboardWriteForm.imageId.value) {
		alert("상품코드를 입력하세요.");
		imageboardWriteForm.imageId.focus();
	} else if(!imageboardWriteForm.imageName.value) {
		alert("상품명을 입력하세요.");
		imageboardWriteForm.imageName.focus();
	} else if(!imageboardWriteForm.imagePrice.value || isNaN(imageboardWriteForm.imagePrice.value)) {
		alert("단가를 확인하세요.");
		imageboardWriteForm.imagePrice.focus();
	} else if(!imageboardWriteForm.imageQty.value || isNaN(imageboardWriteForm.imageQty.value)) {
		alert("개수를 확인하세요.");
		imageboardWriteForm.imageQty.focus();
	}  else if(!imageboardWriteForm.imageContent.value) {
		alert("내용을 입력하세요.");
		imageboardWriteForm.imageContent.focus();
	}  else if(!imageboardWriteForm.image1.value) {
		alert("파일을 첨부하세요.");
	}  else {
		imageboardWriteForm.submit();
	}
}
</script>
</head>
<body>
	<h3>이미지 등록</h3>
	<form action="../imageboard/imageboardWrite.jsp" method="post" 
			name="imageboardWriteForm" enctype="multipart/form-data">
		<table border="1" width="400">
			<tr>
				<th width="100">상품코드</th>
				<td><input type="text" name="imageId" value="img_" size="39"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="imageName" size="39"></td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input type="text" name="imagePrice" size="39"></td>
			</tr>
			<tr>
				<th>개수</th>
				<td><input type="text" name="imageQty" size="39"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="38" name="imageContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="file" name="image1" size="39"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="이미지등록" onclick="checkImageBoardWrite()">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>