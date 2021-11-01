package board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		// 페이징 : 3블럭
		BoardDAO dao = new BoardDAO();
		int totalA = dao.getTotalA(); // 총 데이터의 갯수, 99
		int totalP = (totalA + 9) / 10; // 총 페이지 수, 10

		if (pg > totalP)
			pg = totalP; // pg 수정

		int startPage = (pg - 1) / 3 * 3 + 1; // 1
		int endPage = startPage + 2; // 3
		if (endPage > totalP) {
			endPage = totalP;
		}

		// 1페이지당 목록 10개씩
		int endNum = pg * 10;
		int startNum = endNum - 9;		
		List<BoardBean> list = dao.boardList(startNum, endNum);

		// 2. 데이터 공유
		request.setAttribute("totalP", totalP);
		request.setAttribute("pg", pg);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);

		// 3. view 리턴
		return "/board/boardList.jsp";
	}

}
