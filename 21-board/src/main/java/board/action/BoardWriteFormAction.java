package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardWriteFormAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		// 2. 데이터 공유
		// 3. view 처리 파일 리턴
		request.setAttribute("req", "board/boardWriteForm.jsp");
		return "/index.jsp";
		//return "/index.jsp?req=boardWriteForm";
		//return "/board/boardWriteForm.jsp";
	}

}
