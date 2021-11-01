package exam1.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 1. 웹브라우저 요청받기
@WebServlet("/MessageController")
public class MessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
           
    public MessageController() {
        super();
    }
    
    // get방식
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
    // post방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	// MVC 패턴에서 서블릿의 역할은 controller
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 정보 확인
		String message = request.getParameter("message");
		
		// 2. 요청 작업 처리
		String result = null;
		if(message == null) {
			result = "전달된 내용이 없습니다.";
		} else if(message.equals("host")) {
			result = "고길동 입니다.";
		} else if(message.equals("guest")) {
			result = "홍길동 입니다.";
		} else {
			result = "타입이 맞지 않습니다.";
		}
		
		// 3. 요청처리 결과를 request 객체에 저장
		request.setAttribute("result", result); 
		
		// 4. view처리를 위해 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("/messageView.jsp");
		dispatcher.forward(request, response);
	}
}







