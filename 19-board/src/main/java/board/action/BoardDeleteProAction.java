package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDeleteProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리		
		String board_pass = request.getParameter("board_pass");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println(board_pass);
		
		//DB
		BoardDAO dao = new BoardDAO();
		int su = dao.boardDelete(board_num, board_pass);	
				
		//view처리 파일 리턴		
		if(su>0) {	// 삭제 성공			
			return "boardList.do?pg=" + pg;
		} else {	// 삭제 실패			
			return "boardView.do?pg="+ pg + "&board_num=" + board_num;
		}
	}
}
