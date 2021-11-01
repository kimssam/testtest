package exam4.mvc;

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


@WebServlet("*.do")
public class ControllerURI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 명령어와 명령어 처리 클래스를 쌍으로 저장할 Map 클래스
	private Map<String, Object> map = new HashMap<String, Object>();
     
    public ControllerURI() {
        super();
    }
    
    //명령어와 명령어 처리클래스가 매핑되어 있는 properties 파일을 읽어서 Map 클래스에 저장
    @Override
    public void init(ServletConfig config) throws ServletException {    	
    	// "/property" 폴더의 절대 경로를 구함
    	String realFolder = config.getServletContext().getRealPath("/property");
    	String realPath = realFolder + "/commandURI.properties";
    	
    	// 1. commandURI.properties 파일 읽기
    	// properties파일을 읽어올 Properties 객체 생성
    	Properties properties = new Properties();
    	// 파일을 읽어올 IO 클래스
    	FileInputStream fis = null;
    	try {
    		// command.properties 파일 열기
			fis = new FileInputStream(realPath);
			// command.properties 파일의 내용을 Properties 객체에 저장
			properties.load(fis);
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
    	
    	// 2. commandURI.properties에 설정된 대로 command와 객체를 Map 클래스에 저장
    	// Set 객체의 iterator() 메소드를 사용해서 Iterator 객체를 얻어냄
    	Iterator<?> iterator = properties.keySet().iterator();
    	
    	// Iterator 객체에 저장된 명령어와 명령어 처리 클래스를 Map 객체에 저장
    	while(iterator.hasNext()) {
    		String command = (String) iterator.next();
    		String className = properties.getProperty(command);
    		// 결과 확인용
   			// command = /exam4/message.do
   			// className = exam4.mvc.MessageProcess
   			System.out.println("command = " + command);
   			System.out.println("className = " + className);
   			    		
			try {
				Class<?> commandClass = Class.forName(className);
				// 결과 확인용 : commandClass = class exam3.mvc.MessageAction
				System.out.println("commandClass = " + commandClass);
				// 객체 생성
				Object instance = commandClass.newInstance();
				// map에 저장
				map.put(command, instance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}   			
    	}
    	// map 객체에 저장된 내용 확인
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
		String command = request.getRequestURI();
		String contextPath = request.getContextPath();
		int contextPathLength = request.getContextPath().length();
		System.out.println("command = " + command);
		System.out.println("contextPath = " + contextPath);
		System.out.println("contextPathLength = " + contextPathLength);
		// command = /18-mvc/exam4/message.do
		// contextPath = /18-mvc
		// contextPathLength = 7
		System.out.println("---------------------");
		
		// 요청 정보 추출
		if(command.indexOf(contextPath) == 0) {
			command = command.substring(contextPathLength);
		}
		// command = /exam4/message.do
		System.out.println("command = " + command);
		
		// 2. 요청 작업 처리
		// => 데이터 처리 클래스 선택
		Action action = (Action) map.get(command);
		
		System.out.println("action = " + action);
		
		// 3. 데이터 처리 + view 처리 파일 선택
		String view = null;
		try {
			view = action.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("view = " + view);
		
		// 4. view 처리 파일로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
