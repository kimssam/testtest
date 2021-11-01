package book.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.dao.BookDAO;
import book.dto.BookDTO;


// 브라우저로부터 전달된 데이터를 db에 저장

public class BookWriteProAction implements Action{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.데이터 처리		
		request.setCharacterEncoding("utf-8");
		String serial = request.getParameter("serial");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String publisher = request.getParameter("publisher");
		int cost = Integer.parseInt(request.getParameter("cost"));
		String p_date = request.getParameter("p_date");
		
		//DB
		BookDTO dto = new BookDTO();
		dto.setSerial(serial);
		dto.setSerial(title);
		dto.setWriter(writer);
		dto.setPublisher(publisher);
		dto.setCost(cost);
		dto.setP_date(p_date);
		
		BookDAO dao = new BookDAO();
		int su = dao.bookWrite(dto);
		
		String result = "";
		if(su>0) {
			result = "도서정보를 등록하였습니다";
		} else { 
			result = "도서정보 등록이 실패하였습니다";
		} 
		
		//2.데이터 공유
		request.setAttribute("result", result);
		
		//3.뷰처리 파일리턴
		request.setAttribute("req", "book/write.jsp");
		return "/index.jsp";
	}
	
}
