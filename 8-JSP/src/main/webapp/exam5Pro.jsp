<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% 
    //1. 전달받은 값 추출 (kor, eng, math)
    String name = request.getParameter("name");
	String str_kor = request.getParameter("kor");
	String str_eng = request.getParameter("eng");
	String str_math = request.getParameter("math");
	int kor = 0;
	int eng = 0;
	int math = 0;
	
	// 입력 검사
	if(name != null) {
		if (name.equals("")) {
			out.println("이름이 없습니다.");  // <body> 태그에 출력
			return;
		} 
	} else {
		out.println("이름 입력값이 문제가 있습니다.");
		return;
	}
	// 입력 검사 및 숫자 검사
	if(str_kor != null) {
		if (str_kor.equals("")) {
			out.println("국어점수가 없습니다.");
			return;
		} else {
			// 문자열이 정수인지 검사
			if(str_kor.matches("^[0-9]*$")) {
				kor = Integer.parseInt(str_kor);
			} else {
				out.println("국어점수에 문자가 포함되어 있습니다.");
				return;
			}
		}
	} else {
		out.println("국어 입력값이 문제가 있습니다.");
		return;
	}	
	
	if(str_eng != null) {
		if (str_eng.equals("")) {
			out.println("영어점수가 없습니다.");
			return;
		} else {
			// 문자열이 정수인지 검사
			if(str_eng.matches("^[0-9]*$")) {
				eng = Integer.parseInt(str_eng);
			} else {
				out.println("영어점수에 문자가 포함되어 있습니다.");
				return;
			}
		}
	} else {
		out.println("영어 입력값이 문제가 있습니다.");
		return;
	}	
	
	if(str_math != null) {
		if (str_math.equals("")) {
			out.println("수학점수가 없습니다.");
			return;
		} else {
			// 문자열이 정수인지 검사
			if(str_math.matches("^[0-9]*$")) {
				math = Integer.parseInt(str_math);
			} else {
				out.println("수학점수에 문자가 포함되어 있습니다.");
				return;
			}
		}
	} else {
		out.println("수학 입력값이 문제가 있습니다.");
		return;
	}	
 
    //2. 계산처리 - 총점, 평균, 등급
    int tot = kor + eng + math;
    double avg = (double)tot/3 ;
    String grade= "";
    
    switch((int)(avg/10)) {
    case 10 :
    case 9: grade="수"; break;
    case 8: grade="우"; break;
    case 7: grade="미"; break;
    case 6: grade="양"; break;
    default: grade="가"; break;
    }
    
    /*
    if (avg>=90){
        grade = "수";
    }else if(avg >= 80){
        grade = "우";
    }else if(avg >= 70){
        grade = "미";
    }else if(avg >= 60){
        grade = "양";
    }else if(avg < 60){
        grade = "가";
    } 
    */
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 결과</title>
</head>
<body>
   
    <h2>성적처리 결과</h2>
        <ul>
            <li>이름  : <%=name %></li>
             
            <li>국어 : <%=kor %></li>
            <li>영어  : <%=eng %></li>
            <li>수학  : <%=math %></li>
            <li>총점 : <%=tot %></li>
            <li>평균 : <%=avg %></li>
            <li>등급 : <%=grade %></li>             
        </ul>
</body>
</html>