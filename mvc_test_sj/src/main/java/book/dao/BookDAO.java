package book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import book.dto.BookDTO;


public class BookDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public BookDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//도서정보 신규입력
	public int bookWrite(BookDTO dto) {
		int su = 0;
		String sql = "insert into book2 values (?, ?, ?, ?, ?, ?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSerial());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getPublisher());
			pstmt.setInt(5, dto.getCost());
			pstmt.setString(6, dto.getP_date());

			su = pstmt.executeUpdate(); // insert, update, delete => 리턴값은 처리된 데이터 갯수
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
	
	// 등록된 총 도서의 수 구하기
	public int totalBook() {
		int totalBook = 0;
		String sql = "select count(*) as cnt from book2";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalBook = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalBook;
	}
	//도서목록보기
	public List<BookDTO> bookList(int startNum, int endNum) {
		List<BookDTO> list = new ArrayList<BookDTO>();
		String sql = "select * from "
				   + " (select rownum rn, tt.* from "
				   + " (select * from book2 order by serial asc) tt) "
				   + " where rn>=? and rn<=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
	
			while(rs.next()) {	
				BookDTO dto = new BookDTO();
	            dto.setSerial(rs.getString("serial"));
	            dto.setTitle(rs.getString("title"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setPublisher(rs.getString("publisher"));
	            dto.setCost(rs.getInt("cost"));
	            dto.setP_date(rs.getString("p_date"));
				
				list.add(dto);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
