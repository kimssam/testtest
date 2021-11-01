package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberWriteFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.데이터 처리
		//2.데이터 공유
		//3.뷰처리 파일리턴		
		request.setAttribute("req", "member/writeForm.jsp");
		return "/index.jsp";
	}
	
}
