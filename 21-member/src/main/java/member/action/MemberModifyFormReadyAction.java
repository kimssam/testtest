package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberModifyFormReadyAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 필요한 데이터 얻어서
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		System.out.printf("id:",id);
		
		// 2. DB에 등록하고
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.memberView(id);
		
		// 3. 공유데이터 저장후
		request.setAttribute("dto", dto);
		request.setAttribute("pg", pg);
		//request.setAttribute("id", id); 
		
		//4.뷰처리
		request.setAttribute("req", "member/modifyForm.jsp");
		return "/index.jsp";
	}

}
