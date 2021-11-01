package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		// DB
		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.boardView(board_num);
		
		// 화면 네비게이션
		// 1. 공유데이터 저장
		request.setAttribute("bean", bean);
		request.setAttribute("pg", pg);
		request.setAttribute("board_num", board_num);		
		
		return "/board/board_modify.jsp";
	}

}
