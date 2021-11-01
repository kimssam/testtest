package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardReplyProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		request.setCharacterEncoding("utf-8");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 답글 정보 저장
		BoardBean bean = new BoardBean();
		bean.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		bean.setBoard_name(request.getParameter("board_name"));
		bean.setBoard_pass(request.getParameter("board_pass"));
		bean.setBoard_subject(request.getParameter("board_subject"));
		bean.setBoard_content(request.getParameter("board_content"));
		bean.setBoard_re_ref(Integer.parseInt(request.getParameter("board_re_ref")));
		bean.setBoard_re_lev(Integer.parseInt(request.getParameter("board_re_lev")));
		bean.setBoard_re_seq(Integer.parseInt(request.getParameter("board_re_seq")));
		
		// db
		BoardDAO dao = new BoardDAO();
		int su = dao.insertReplyArticle(bean);
		
		// 2. 데이터 공유		
		// 3. view 처리 파일명 리턴
		if(su > 0) {
			response.sendRedirect("boardList.do?pg=" + pg);  // 주소창의 주소가 바뀜
			// return "boardList.do?pg=" + pg;  // forward 방식으로 화면이동이 되면 새로고침에서 답글이 계속 추가됨			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글저장 실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
}


