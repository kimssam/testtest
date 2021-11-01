<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록</title>
<script type="text/javascript">
	function checkImageBoardModify() {
		if(!imageboardModifyForm.imageId.value) {
			alert("상품코드를 입력하세요.");
			imageboardModifyForm.imageId.focus();
		} else if(!imageboardModifyForm.imageName.value) {
			alert("상품명을 입력하세요.");
			imageboardModifyForm.imageName.focus();
		} else if(!imageboardModifyForm.imagePrice.value || isNaN(imageboardModifyForm.imagePrice.value)) {
			alert("단가를 확인하세요.");
			imageboardModifyForm.imagePrice.focus();
		} else if(!imageboardModifyForm.imageQty.value || isNaN(imageboardModifyForm.imageQty.value)) {
			alert("개수를 확인하세요.");
			imageboardModifyForm.imageQty.focus();
		}  else if(!imageboardModifyForm.imageContent.value) {
			alert("내용을 입력하세요.");
			imageboardModifyForm.imageContent.focus();
		}  else {
			imageboardModifyForm.submit();
		}
	}
</script>
</head>
<body>
	<h3>이미지 수정</h3>
	<form action="../imageboard/imageboardModify.jsp" method="post" 
			name="imageboardModifyForm" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="${seq}">
		<input type="hidden" name="pg" value="${pg}">
		
		<table border="1" width="400">
			<tr>
				<th width="100">상품코드</th>
				<td><input type="text" name="imageId" value="${dto.imageId }" size="39"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="imageName" value="${dto.imageName }" size="39"></td>
			</tr>
			<tr>
				<th>단가</th>
				<td><input type="text" name="imagePrice" value="${dto.imagePrice }" size="39"></td>
			</tr>
			<tr>
				<th>개수</th>
				<td><input type="text" name="imageQty" value="${dto.imageQty }" size="39"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="38" name="imageContent">${dto.imageContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name="image1" size="39">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="이미지수정" onclick="checkImageBoardModify()">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>