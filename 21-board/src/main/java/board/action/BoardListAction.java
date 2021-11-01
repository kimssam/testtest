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
		if(request.getParameter("pg")!=null){
			pg=Integer.parseInt(request.getParameter("pg"));
		}
		
		// 페이징 : 3블럭
		BoardDAO dao = new BoardDAO();
		int totalData = dao.totalData();	// 총목록수
		int totalPage = (totalData+9)/10;	// 총페이지수
		
		if(pg > totalPage) pg = totalPage;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage+2;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		// 목록 : 10개씩
		// 리스트 길이 정하기용
		int endNum = pg * 10;
		int startNum = endNum-9;
		
		List<BoardBean> list = dao.boardList(startNum,endNum);
		
		// 2. 데이터 공유
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		
		// 3. 파일명 리턴
		request.setAttribute("req", "board/boardList.jsp");
		return "/index.jsp";
		//return "/index.jsp?req=boardList";
		//return "/board/boardList.jsp";
	}
}
