package board.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownAction implements Action {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileName = request.getParameter("downFile");
		String realPath = request.getServletContext().getRealPath("/boardUpload");
		
		File file = new File(realPath,fileName);
		
		// HDD의 파일을 RAM에 저장
		FileInputStream fis = new FileInputStream(file);		// 파일 오픈
		BufferedInputStream bis = new BufferedInputStream(fis);	// 보조 스트림 클래스 객체 생성
		byte[] b = new byte[(int)file.length()];				// 파일 데이터를 저장할 변수(배열) 만들기
		bis.read(b,0,b.length);	// 배열에 파일 데이터 저장
		bis.close();
		fis.close();
		
		// RAM에 저장된 파일을 브라우저로 전송
		response.setHeader("Content-Disposition", "attachment; fileName="+URLEncoder.encode(fileName,"UTF-8"));
		response.setHeader("Content-Length", String.valueOf(file.length()));
		
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);	// 보조 스트림 클래스 객체 생성
		bos.write(b);	// 브라우저로 전송
		bos.close();		
		
		return null;
	}

}
