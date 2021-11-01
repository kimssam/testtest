package board.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.Servlet;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

public class FileDownAction implements Action{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileName = request.getParameter("downFile");
		// 파일이 저장된 실제 폴더위치 구하기
		String realPath = request.getServletContext().getRealPath("/boardUpload");
		
		System.out.println("fileName = " + fileName);
		System.out.println("realPath = " + realPath);
		// 다운받고자 하는 파일
		File file = new File(realPath, fileName);
		//System.out.println("file = " + file);
		
		// 기존 jsp의 객체 out의 스트림을 지우고 출력해야, 예외발생이 안생김		
		// => jsp 파일에서 다운로드 할 경우에만 필요함
		//out.clear();
		//out = pageContext.pushBody();
		
		// HDD에 저장된 파일을 RAM으로 읽어옴
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		byte[] b = new byte[(int)file.length()];
		bis.read(b, 0, b.length);  // bis.read(배열명, 배열시작위치, 배열의 크기)
		bis.close();
		fis.close();
		
		// 클라이언트로 전송
		// => "파일 다운로드" 형태로 전송
		// => 파일 정보를 Header에 저장해서 클라이언트로 전송
		// => 파일이름과 파일크기 
		response.setHeader("Content-Disposition", "attachment; fileName=" + URLEncoder.encode(fileName, "UTF-8"));
		response.setHeader("Content-Length", String.valueOf(file.length()));
		
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		bos.write(b);
		bos.close();   
		
		return null;
	}
}
