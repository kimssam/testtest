package board.action;

import java.io.PrintWriter;

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
		// 3. view 처리 파일 리턴
		if(su > 0) {
			// 삭제 시 목록으로 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 성공');");
			out.println("location.href = 'boardList.do?pg=" + pg + "';");
			out.println("</script>");
			//return "/boardList.do?pg=" + pg;
		} else {
			// 삭제 실패 시 view 화면으로 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패');");
			String str = "'boardDetail.do?pg=" + pg + "&board_num=" + board_num + "'";
			//out.println("location.href = " + str + ";");
			out.println("history.go(-2);");
			out.println("</script>");
			//return "/boardDetail.do?pg=" + pg + "&board_num=" + board_num;
		}
		return null;
	}

}
