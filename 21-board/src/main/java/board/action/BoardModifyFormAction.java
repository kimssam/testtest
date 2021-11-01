package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyFormAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.boardDetail(board_num);
		
		request.setAttribute("bean", bean);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "board/boardModify.jsp");
		return "/index.jsp";
		//return "/index.jsp?req=boardModify";
		//return "/board/boardModify.jsp";
	}

}
