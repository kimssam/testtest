package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 세션 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		// 2. 무효화 : 모두 지우기
		session.invalidate();
		
		// 3. 뷰처리 파일 리턴
		request.setAttribute("req", "member/logout.jsp");
		return "/index.jsp";
	}
}
