package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberWriteAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.데이터 처리		
		request.setCharacterEncoding("utf-8");
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
		
		//DB
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
		dto.setAddr(addr);
		
		MemberDAO dao = new MemberDAO();
		int su = dao.memberWrite(dto);
		
		String result = "";
		if(su>0) {
			result = "회원 가입 성공";
		} else { 
			result = "회원 가입 실패";
		} 
		
		//2.데이터 공유
		request.setAttribute("result", result);
		
		//3.뷰처리 파일리턴
		request.setAttribute("req", "member/write.jsp");
		return "/index.jsp";
	}
	
}
