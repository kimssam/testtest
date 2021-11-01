package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardReplyFormAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pg=Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.boardDetail(board_num);  // 원글 데이터
		
		request.setAttribute("bean", bean);
		request.setAttribute("pg", pg);
		
		request.setAttribute("req", "board/boardReply.jsp");
		return "/index.jsp";
		//return "/index.jsp?req=boardReply";
		//return "/board/boardReply.jsp";
	}

}
