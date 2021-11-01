package book.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.action.Action;


@WebServlet("*.do")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();
       
    public BookController() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	String realFolder = config.getServletContext().getRealPath("/property");
    	String realPath = realFolder + "/command.properties";
    	Properties properties = new Properties();
    	FileInputStream fis = null;
    	
    	try {
			fis = new FileInputStream(realPath);  // 파일을 오픈함
			properties.load(fis);				  // command.properties을 읽어옴
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
    	
    	// command.properties에 설정된대로 command와 객체를 Map에 저장.
    	Iterator<?> iterator = properties.keySet().iterator();
    	
    	while(iterator.hasNext()) {
    		String command = (String)iterator.next();	// key값 읽어오기
    		String className = properties.getProperty(command); // value값 읽어오기
    		System.out.println("command = " + command);
			System.out.println("className = " + className);

    		try {
				Class<?> commandClass = Class.forName(className); // 클래스가 있는지 검사하고 Class 객체 리턴
				Object instance = commandClass.newInstance();  // 객체 생성
				// 맵 객체에 키값과 해당 객체 저장
				map.put(command, instance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
    	}
    	System.out.println(map.toString());
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 정보 확인
		String command = request.getServletPath();		
		System.out.println("command = "+command);	
		
		// 2. 요청 작업 처리
		Action action = (Action)map.get(command);
		
		// 3. 데이터 처리 + view 처리 파일 선택
		String view = null;
		try {
			view = action.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 4. view 처리 파일로 이동
		if(view != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

}
