package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_subject = request.getParameter("board_subject");
		String board_content = request.getParameter("board_content");
		
		// bean에 저장
		BoardBean bean = new BoardBean();
		bean.setBoard_name(board_name);
		bean.setBoard_subject(board_subject);
		bean.setBoard_content(board_content);
		bean.setBoard_num(board_num);
		bean.setBoard_pass(board_pass);
		
		// DB 작업
		BoardDAO dao = new BoardDAO();
		int su = dao.boardModify(bean);	
		
		// 2. view 처리 파일 리턴
		if(su > 0) {	// 수정 성공
			return "boardView.do?pg=" + pg + "&board_num=" + board_num;
		} else {		// 수정 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
}
