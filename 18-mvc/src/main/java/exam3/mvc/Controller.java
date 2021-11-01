package exam3.mvc;

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

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 명령어와 명령어 처리 클래스를 쌍으로 저장할 Map 클래스
    private Map<String, Object> map = new HashMap<String, Object>();
    
    public Controller() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	// 'property' 폴더의 절대 경로를 구함
    	String realFolder = config.getServletContext().getRealPath("/property");
    	String realPath = realFolder + "/command.properties";
    	
    	// properties 파일을 관리할 클래스
    	Properties properties = new Properties();
    	// 파일을 읽어올 IO 클래스
    	FileInputStream fis = null;
    	try {
    		// 파일 열기
			fis = new FileInputStream(realPath);
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
    	// command.properties의 command값만 읽어옴
    	Iterator<?> iterator = properties.keySet().iterator();
    	
    	// iterator 객체에 저장된 command값과 
    	// command.properties에 등록된 클래스를 객체 생성후 Map 클래스에 저장
    	while(iterator.hasNext()) {
    		String command = (String) iterator.next();    		// command 값 (=key값)
    		String className = properties.getProperty(command); // 클래스 명 (=value값)
    		System.out.println("command = " + command);
    		System.out.println("className = " + className);
    		
    		try {
				Class<?> commandClass = Class.forName(className);
				Object instance = commandClass.newInstance();   // 객체 생성
				// Map 클래스에 저장
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
		String command = request.getParameter("command");
		
		// 2. 요청 작업 처리
		// => 데이터 처리 클래스 선택
		Action action = (Action)map.get(command);
		
		// 3. 데이터 처리 + view 처리 파일 선택
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







