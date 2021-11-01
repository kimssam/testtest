package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;

public class LoginAction implements Action{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 데이터 읽기
		request.setCharacterEncoding("utf-8" );
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");		
		
		// 2. DB작업
		MemberDAO dao = new MemberDAO();
		String name = dao.login(id, pwd);
		
		// 3. 뷰처리 파일 리턴
		//session을 이용하기 위해 HttpSession클래스 활용
		HttpSession session = request.getSession(); 
		if(name != null) {	// 로그인 성공
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			
			request.setAttribute("req", "member/loginOk.jsp");	
		} else {			// 로그인 실패
			request.setAttribute("req", "member/loginFail.jsp");
		}
		return "/index.jsp";
	}
}
