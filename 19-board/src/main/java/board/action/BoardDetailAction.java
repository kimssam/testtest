package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDetailAction implements Action{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 데이터 처리
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.boardView(board_num);
		
		// 데이터 공유
		request.setAttribute("board_num", board_num);
		request.setAttribute("pg", pg);
		request.setAttribute("bean", bean);
		
		// 리턴
		return "/board/board_view.jsp"; 
	}
}
