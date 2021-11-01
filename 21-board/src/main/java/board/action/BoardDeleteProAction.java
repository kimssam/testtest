package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;

public class BoardDeleteProAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		// 1. 데이터 처리
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_pass = request.getParameter("board_pass");

		// DB
		BoardDAO dao = new BoardDAO();
		int su = dao.boardDelete(board_num, board_pass);
		
		// 2. 데이터 공유
		request.setAttribute("su", su);
		request.setAttribute("pg", pg);
		
		// 3. view 처리 파일 리턴
		request.setAttribute("req", "board/boardDeletePro.jsp");
		return "/index.jsp";
		//return "/index.jsp?req=boardDeletePro";
		//return "/board/boardDeletePro.jsp";
	}

}
