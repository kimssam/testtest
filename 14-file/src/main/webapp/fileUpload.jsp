<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터 처리
	/* form 태그에 enctype="multipart/form-data"로
	   설정되어 있으면, request 객체로는 문자열을 읽어올 수 없다.
	
	String subject = request.getParameter("subject");
	System.out.println("subject = " + subject);
	*/
	
	// 실제 파일 저장 폴더 위치 확인
	String realFolder = request.getServletContext().getRealPath("/storage");
	System.out.println("realFolder = " + realFolder);
	
	// 브라우저에서 보내온 문자열과 파일 데이터는 cos.jar에 있는 MultipartRequest 사용
	// => 5*1024*1024 : 5MB, 업로드 할 때의 최대 파일 크기 설정
	// => new DefaultFileRenamePolicy() : 업로드시, 똑같은 파일이름이 있을 경우,
	//									  기존 파일이름에 숫자를 덧붙여서 저장한다.
	MultipartRequest multi = new MultipartRequest(request, realFolder,
					5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	
	// 브라우저에서 서버로 보낸 파일 이름
	String originalFileName1 = multi.getOriginalFileName("upload1");
	String originalFileName2 = multi.getOriginalFileName("upload2");
	// 서버의 storage 폴더에 저장된 파일 이름
	String fileName1 = multi.getFilesystemName("upload1");
	String fileName2 = multi.getFilesystemName("upload2");
	
	// 저장된 파일의 크기
	File file1 = multi.getFile("upload1");
	File file2 = multi.getFile("upload2");
	// file1 = D:\aa_class\bigdata_ycs\jsp\workspace\.metadata\.plugins\
	// org.eclipse.wst.server.core\tmp0\wtpwebapps\14-file\storage\cupra2.jpg
	System.out.println("file1 = " + file1);
	
	long fileSize1 = 0;
	long fileSize2 = 0;
	if(file1 != null) fileSize1 = file1.length();
	if(file2 != null) fileSize2 = file2.length();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<ul>
		<li>제목 : <%=subject %></li>
		<li>내용 : <%=content %></li>
		<li>파일 : <a href="fileDownload.jsp?fileName=<%=URLEncoder.encode(originalFileName1, "UTF-8")%>">
			 		<%=originalFileName1 %></a> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=fileName1 %></li>
		<li>크기 : <%=fileSize1 %></li>
		<br><br>
		<li>파일 : <%=originalFileName2 %> 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=fileName2 %></li>
		<li>크기 : <%=fileSize2 %></li>
	</ul>
	
	<img alt="그림" src="storage/<%=fileName1%>" width="100" height="100"> 
	<img alt="그림" src="storage/<%=fileName2%>" width="100" height="100"> 
</body>
</html>


