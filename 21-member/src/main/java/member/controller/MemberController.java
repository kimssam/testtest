package member.controller;

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

import member.action.Action;

@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 명령어와 명령어 처리 클래스를 쌍으로 저장할 Map 클래스
	private Map<String, Object> map = new HashMap<String, Object>();

	public MemberController() {
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
			fis = new FileInputStream(realPath); // 파일 오픈
			properties.load(fis); // 파일 읽어오기
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// properties 파일에서 key값과 value값을 읽어오기
		// => value 값에 설정된대로 객체 생성하기
		// => Map 객체에 (key, 객체) 형식으로 저장하기

		// command.properties의 key값만 읽어옴
		// => message=exam3.mvc.MessageAction 의 왼쪽값들(key값들)만 읽어옴
		Iterator<?> iterator = properties.keySet().iterator();

		// iterator 객체에 저장된 command 값과 command.properties에 등록된 클래스를 객체 생성후 Map 클래스에 저장
		while (iterator.hasNext()) {
			String command = (String) iterator.next(); 			// key 값 : command
			String className = properties.getProperty(command); // value 값 : 클래스명
			System.out.println("command = " + command);
			System.out.println("className = " + className);

			try {
				Class<?> commandClass = Class.forName(className); // 클래스가 있는지 확인하는 Class<?>?는 어떤 자료형을 써도 된다는 제네릭, 나중에
																  // 자식에서 자료형을 명시해서 사용가능
				Object instance = commandClass.newInstance(); 	// 객체생성, 중간줄표시는 deprecated표시임: 앞으로 없어질 명령어다라는 의미로 진짜 없어지기
																// 전까지 사용함. 자바의 최상위 부모인 Object로 담는 이유는 다형성(부모 기준으로 다양한
																// 자료형으로 사용하기 위해)

				// Map 클래스에 저장 (key, 객체)
				map.put(command, instance);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		System.out.println(map.toString());   // Map 객체에 저장된 내용 확인
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 정보 확인
		String message = request.getServletPath();
		System.out.println("message = " + message);
		
		// 2. 요청 작업 처리 객체 선택 (데이터 처리 객체 선택)
		Action action = (Action)map.get(message);
		
		// 3. 요청 작업 처리 
		// => 데이터 처리후, 결과를 보여줄 view 파일 리턴
		String view = null;
		try {
			view = action.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 4. View처리를 위해 화면 이동
		if(view != null) { 
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}		
	}
}








