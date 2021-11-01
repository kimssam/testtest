package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberModifyAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// 1. 필요한 데이터 얻고
		int pg = Integer.parseInt(request.getParameter("pg"));
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr = request.getParameter("addr");
		
		// 2. dto에 저장후
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setGender(gender);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);
		dto.setAddr(addr);;
		
		// 3. DB에 등록하고
		MemberDAO dao = new MemberDAO();
		int su = dao.modify(dto);
		
		// 4. 데이터 공유
		request.setAttribute("su", su);
		
		// 5. view 처리 파일 리턴
		request.setAttribute("req", "member/modify.jsp");
		return "/index.jsp";
	}
}
