package exam2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam2.message.Action;
import exam2.message.MessageGuestAction;
import exam2.message.MessageHostAction;
import exam2.message.MessageMismatchAction;
import exam2.message.MessageNullAction;

// 1. 웹브라우저 요청받기
@WebServlet("/MessageController2")
public class MessageController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MessageController2() {
        super();
    }
    // get 방식
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	// post 방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 정보 확인
		String message = request.getParameter("message");
		
		// 2. 요청 작업 처리
		// => 데이터 처리 클래스 선택
		Action action = null;
		if(message == null) {
			action = new MessageNullAction();
		} else if(message.equals("host")) {
			action = new MessageHostAction();
		} else if(message.equals("guest")) {
			action = new MessageGuestAction();
		} else {
			action = new MessageMismatchAction();
		} 
		
		// 3. 데이터 처리 및 view 처리 파일 선택
		String view = null;
		try {
			view = action.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		// 4. view 처리 파일로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}





