package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
// 커넥션 풀 사용으로 주석 처리
//	   String driver = "oracle.jdbc.driver.OracleDriver";
//	   String url = "jdbc:oracle:thin:@localhost:1521:xe";
//	   String username = "C##dbexam";
//	   String password = "m1234";
	   
	   Connection conn;
	   PreparedStatement pstmt;
	   ResultSet rs;
	   DataSource ds;	// 커넥션 풀을 관리하는 DataSource 객체
	   
	   // 커넥션 풀을 관리하는 DataSource 객체 얻어오기
	   public BoardDAO() {
		   // import javax.naming.Context;
		   // import javax.naming.InitialContext;
		   try {
				Context context = new InitialContext();
				// 톰캣인 경우, DataSource 객체를 찾을 경우,
				// 반드시 커넥션풀 설정이름 앞에 "java:comp/env/"를 붙여야한다.
				ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			} catch (NamingException e) {
				e.printStackTrace();
			}
	   }
	   
//	   public BoardDAO() {
//	      try {
//	         Class.forName(driver);
//	         System.out.println("드라이버 등록 성공");
//	      } catch (ClassNotFoundException e) {
//	         e.printStackTrace();
//	      }
//	   }
//	   public Connection getConnection() {
//	      try {
//	         conn = DriverManager.getConnection(url, username, password);
//	         System.out.println("접속 성공");
//	      } catch (SQLException e) {
//	         e.printStackTrace();
//	      }
//	      return conn;
//	   }
	   
	   public void close() {
	      try {
	         if(rs != null) rs.close();
	         if(pstmt != null) pstmt.close();
	         if(conn != null) conn.close();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	   }
	   
	   //개별적으로 insert할 함수
	   public int boardWrite(BoardDTO dto) {
	      int su=0;
	      String sql = "insert into board values (seq_board.nextval, ?, ?, ?, ?, 0, sysdate)";
	      
	      //conn = getConnection();
	      try {
	    	 conn = ds.getConnection();   // 커넥션풀에서 커넥션 객체1개 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getId());
	         pstmt.setString(2, dto.getName());
	         pstmt.setString(3, dto.getSubject());
	         pstmt.setString(4, dto.getContent());
	         
	         su = pstmt.executeUpdate(); //insert, update, delete => return 값은 처리된 데이터의 갯수
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return su;
	   }
	   
	   // 5개씩 목록보기
	   public List<BoardDTO> boardList(int startNum, int endNum) {
		   // 목록 데이터를 저장한 리스트 객체
		   List<BoardDTO> list = new ArrayList<BoardDTO>();
		   String sql = "select seq, id, name, subject, content, hit, "
		   		      + " to_char(logtime, 'YYYY.MM.DD') as logtime from "
		   		      + " (select rownum rn, tt.* from "
		   		      + " (select * from board order by seq desc) tt) "
		   		      + " where rn>=? and rn<=?";
		   
		   try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startNum);
				pstmt.setInt(2, endNum); 
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setHit(rs.getInt("hit"));
					dto.setLogtime(rs.getString("logtime"));
					// 리스트에 저장
					list.add(dto);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		   return list;
	   }
	   
	   // 상세보기
	   public BoardDTO boardView(int seq) {
		   BoardDTO dto = null;
		   String sql = "select * from board where seq=?";
		   try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, seq); 
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new BoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setHit(rs.getInt("hit"));
					dto.setLogtime(rs.getString("logtime"));
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		   return dto;
	   }
	   
	   // 조회수 증가하기
	   public int updateHit(int seq) {
		   int su = 0;
		   String sql = "update board set hit=hit+1 where seq=?";
		   try {
				conn =ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, seq);
				su = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		   return su;
	   }
	   
	   // 총 데이터수 구하기
	   public int getTotalA() {
		   int totalA = 0;
		   String sql = "select count(*) as cnt from board";
		   try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					totalA = rs.getInt("cnt");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		   return totalA;
	   }
	   
	   // 게시글 삭제하기
	   public int delete(int seq ) {
	      int su = 0;
	      String sql = "delete board where seq=?";
	      
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, seq);
	         su = pstmt.executeUpdate();	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return su;
	   }
	   
	   // 글수정
	   public int boardModify(BoardDTO dto) {
		      int su =0;
		      String sql = "update board set subject=?, content=? where seq=?";
		      
		      try {
		         conn = ds.getConnection();    //커넥션풀에서 커넥션 객체 1개 얻어오기.
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, dto.getSubject());
		         pstmt.setString(2, dto.getContent());
		         pstmt.setInt(3, dto.getSeq());
		         
		         su = pstmt.executeUpdate();		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close();
		      }
		      return su;
	   }
}








