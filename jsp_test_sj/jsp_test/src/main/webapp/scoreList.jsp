<%@page import="score.dto.ScoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="score.dao.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	// 1페이지당 목록 10개씩
	int endNum = pg*10;
	int startNum = endNum-9;
		
	// DB
	ScoreDAO dao = new ScoreDAO(); 
	List<ScoreDTO> list = dao.scoreList(startNum, endNum);
	
	//페이징 : 3블럭
	int totalA = dao.getTotalMember(); // 총 데이터의 갯수
	int totalP = (totalA + 9)/10;  // 총 페이지 수
	
	if(pg>totalP) pg = totalP;	// pg 수정	
	
	int startPage=(pg-1)/3*3+1; 
	int endPage=startPage+2; 
	if(endPage > totalP) {
		endPage = totalP;
	}
%>  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
	magin:0;
	padding:0;
	}
	html,body{
	width:100%;
	height:100%;
	position:absolute;
	}
	h1{
	text-align:center;
	}
	#wrapper{
	width:800px;
	position:absolute;
	top:10%;
	left:50%;
	margin-left:-400px;
	}
	table{
	background-color:linen;
	width:100%;
	height:100%;
	border-collapse:collapse;
	border-color:lightgray;
	}
	table td{
	text-align:center;
	}
	.paging{
	color:gray;
	text-decoration:none;
	}
	.currentPaging{
	color:red;
	font-size:1.2em;
	text-decoration:none;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<h1>::학생성적목록::</h1>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			
			<% for(ScoreDTO dto : list) { %> <!-- 모든 데이터 출력시 확장for문 사용가능: 간단-->
		    <tr align="center" bgcolor="#ffffcc">
		       <td><%=dto.getId() %></td>
		       <td><%=dto.getName() %></td>
		       <td><%=dto.getKorean() %></td>
		       <td><%=dto.getEnglish() %></td>
		       <td><%=dto.getMath() %></td>
		       <td><%=dto.getKorean() + dto.getEnglish() + dto.getMath()  %></td>
		       <td><%=(dto.getKorean() + dto.getEnglish() + dto.getMath())/3 %></td>
		     </tr> 
		   <% } %>
		   
		   	<!-- 페이징 -->
		   	<tr>
		         <td colspan="7" align="center">
		         <% if(startPage > 3){ %>
		         	[<a class="paging" href="scoreList.jsp?pg=<%=startPage-1%>">이전</a>]
		         <% } %>
		         
		         <% for(int i=startPage; i<=endPage; i++){ %>
		         	<% if(pg==i){ %>
		         	[<a class="currentPaging" href="scoreList.jsp?pg=<%=i %>"><%=i %></a>]
		         	<% }else{ %>
		         	[<a class="paging" href="scoreList.jsp?pg=<%=i %>"><%=i %></a>]
		         	<% } %>
		         <% } %> 
		         
		    	 	<% if(endPage < totalP){ %>    
			         [<a class="paging" href="scoreList.jsp?pg=<%=endPage+1%>">다음</a>]
			     <% } %>    
		         </td>
		     </tr>
			 <tr align="center">
				<td colspan="7">
					<input type="button" value="추가입력" onclick="location.href='index.jsp'">
				</td>
			</tr>
		</table>
	</div>	
</body>
</html>