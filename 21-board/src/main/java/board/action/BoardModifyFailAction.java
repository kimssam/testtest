package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyFailAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("req", "board/boardModifyFail.jsp");
		return "/index.jsp";
		//return "/index.jsp?req=boardModifyFail";
		//return "/board/boardModifyFail.jsp";
	}

}
