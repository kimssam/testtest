package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDetailAction implements Action{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO dao = new BoardDAO();
		int result = dao.read_count(board_num);		// 조회수 증가
		BoardBean bean = dao.boardDetail(board_num);// 상세보기 데이터		
		/*
		if(result > 0) {
			System.out.println("조회수 증가 성공");
		}else {
			System.out.println("조회수 증가 실패");
		}
		*/
		request.setAttribute("pg", pg);
		request.setAttribute("bean", bean);
		
		return "board/boardView.jsp";
	}
}