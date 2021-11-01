package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;

public class MemberDeleteAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		int su = dao.memberDelete(id, pwd);
		
		String result = "";
		if(su > 0) {
			result = "회원 탈퇴가 완료되었습니다.";
			
			// 세션 삭제
			HttpSession session = request.getSession();
			
			session.removeAttribute("memName");
			session.removeAttribute("memId");
			
			// 무효화 : 모두 지우기
			session.invalidate();
		} else {
			result = "회원 탈퇴에 실패하였습니다.";
		}
		request.setAttribute("result", result);		
		
		request.setAttribute("req", "/member/delete.jsp");
		return "index.jsp";
	}
}
