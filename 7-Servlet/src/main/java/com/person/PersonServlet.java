package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public PersonServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터 처리
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobbies");
		String color = request.getParameter("color");
		String[] subject = request.getParameterValues("subject");
		
		String str_hobby = "";
		String str_subject = "";
		
		for(int i=0; i<hobbies.length; i++) {
			str_hobby += hobbies[i] + "  ";
		}
		for(int i=0; i<subject.length; i++) {
			str_subject += subject[i] + "  ";
		}
		
		// HTML 문서 만들기  ---> ????????????
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet</title>");
		out.println("<style>");
		out.println("li {color: yellow;}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body bgcolor='" + color + "'>");
		out.println("<ul>");
		out.println("<li>" + name + "</li>");
		out.println("<li>" + gender + "</li>");
		out.println("<li>" + str_hobby + "</li>");
		out.println("<li>" + color + "</li>");
		out.println("<li>" + str_subject + "</li>");
		out.println("</ul>");
		out.println("<br>");
		out.println("<a href='#' onclick='history.go(-1); return false;'>");
		out.println("뒤로");
		out.println("</a>");
		out.println("</body>");
		out.println("</html>");
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
