package member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberListAction implements Action{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 데이터 처리
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}                                             
		
		//페이징 : 3블럭
		MemberDAO dao = new MemberDAO();
		int totalList = dao.getTotalMember(); 	// 총목록수
		int totalP = (totalList + 4)/5; 		// 총페이지수
		
		if(pg>totalP) pg = totalP;	//가장 마지막 페이지가 삭제되었을 때 텅빈 페이지가 보이지 않고 그 전 페이지로 넘어가도록 하기위해 추가!
		
		int startPage=(pg-1)/3*3+1; 
		int endPage=startPage+2; 
		if(endPage > totalP) {
			endPage = totalP;
		}
		
		// 1페이지당 목록 5개씩
		int endNum = pg*5;
		int startNum = endNum-4;
		
		List<MemberDTO> list = dao.memberList(startNum, endNum); 
		
		//2. 데이터 공유
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("totalP", totalP);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		//3. 뷰처리 파일 리턴
		request.setAttribute("req", "member/memberList.jsp");
		return "/index.jsp";
	}
}


		







