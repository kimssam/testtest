package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String board_name = request.getParameter("board_name");
	    String board_pass = request.getParameter("board_pass");
	    String board_subject = request.getParameter("board_subject");
	    String board_content = request.getParameter("board_content");
		
	    BoardBean bean = new BoardBean();
	    bean.setBoard_name(board_name);
	    bean.setBoard_pass(board_pass);
	    bean.setBoard_subject(board_subject);
	    bean.setBoard_content(board_content);
	    bean.setBoard_num(board_num);

	    BoardDAO dao = new BoardDAO();
	    int su = dao.boardModify(bean);

	    if(su>0) {
	    	response.sendRedirect("boardDetail.do?pg=" + pg + "&board_num=" + board_num);
	    } else {
	    	return "boardModifyFail.do?pg=" + pg + "&board_num=" + board_num;
	    }
		return null;
	}
}
