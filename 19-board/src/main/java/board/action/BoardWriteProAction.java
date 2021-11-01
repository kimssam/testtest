package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardBean;
import board.dao.BoardDAO;

// 브라우저로부터 전달된 데이터를 db에 저장
public class BoardWriteProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		String realFolder = request.getServletContext().getRealPath("/boardUpload");
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, 
				5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		
		String board_name = multi.getParameter("board_name");
		String board_pass = multi.getParameter("board_pass");
		String board_subject = multi.getParameter("board_subject");
		String board_content = multi.getParameter("board_content");
		String board_file = multi.getOriginalFileName("board_file");
		// DB
		BoardBean bean = new BoardBean();
		bean.setBoard_name(board_name);
		bean.setBoard_pass(board_pass);
		bean.setBoard_subject(board_subject);
		bean.setBoard_content(board_content);
		bean.setBoard_file(board_file);
		
		BoardDAO dao = new BoardDAO();
		int su = dao.boardWrite(bean);
		
		// 2. 데이터 공유
		request.setAttribute("su", su);
		
		// 3. view 처리 파일 리턴
		return "/boardList.do";		
	}

}
