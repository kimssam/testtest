package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;

public class MemberCheckIdAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		String id = request.getParameter("id");

		// DB
		MemberDAO dao = new MemberDAO();
		boolean exist = dao.isExistId(id); 
		
		// 2. 데이터 공유
		request.setAttribute("id", id);
		request.setAttribute("exist", exist);
		
		// 3. view 처리 파일명 리턴
		return "/member/checkId.jsp";
	}

}
