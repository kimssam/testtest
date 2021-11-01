package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public HelloServlet() {
        super();
    }
    
    // 클래스를 구동할 때 제일 먼저 호출함 : 구동될 때 한번만 호출함
    // 초기화 작업
    @Override
    public void init() throws ServletException {
       System.out.println("init() 호출");
    }
    
    // 클라이언트로부터 get방식으로 요청받으면 톰캣서버가 실행시킴
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("doGet() 호출");
      // 데이터 처리
      
      // HTML 문서 만들기
      response.setContentType("text/html; charset=UTF-8");   // 응답으로 돌아가는 파일의 종류설정
      PrintWriter out = response.getWriter();      // 문자 출력 객체, 문자열로 HTML 문서를 출력
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<p>Hello Servlet</p>");
      out.println("<p>안녕하세요, 서블릿!</p>");
      out.println("</body>");
      out.println("</html>");
   }
   // 클라이언트로부터 post방식으로 요청받으면 톰캣서버가 실행시킴
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}