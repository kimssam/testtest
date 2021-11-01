package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.bean.MemberDTO;

public class MemberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "C##dbexam";
	String password = "m1234";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		try {
			Class.forName(driver);
			System.out.println("드라이서 등록 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("접속 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int write(MemberDTO dto) {
		int su=0;
		String sql = "insert into member values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail1());
			pstmt.setString(6, dto.getEmail2());
			pstmt.setString(7, dto.getTel1());
			pstmt.setString(8, dto.getTel2());
			pstmt.setString(9, dto.getTel3());
			pstmt.setString(10, dto.getAddr());
			
			su = pstmt.executeUpdate();  // insert, update, delete => 리턴값은 처리된 데이터 갯수
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
	
	public String login(String id, String pwd) {
		String name = null;
		String sql = "select * from member where id=? and pwd=?";
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();  // select => 리턴값은 검색 결과 문자열을 저장한 ResultSet 객체.
			if(rs.next()) {  
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return name;
	}
	// 아이디 유무 검사
	public boolean isExistId(String id) {
		boolean exist = false;
		String sql = "select * from member where id=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			
			rs = pstmt.executeQuery();
			// 값이 있는 지 여부만 검사
			if(rs.next()) {
				exist = true;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return exist;
	}
	
	// 회원정보 보기
	public MemberDTO memberView(String id) {
		MemberDTO dto = null;
	    String sql = "select * from member where id=?";
	    conn = getConnection();
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, id);
	        rs = pstmt.executeQuery();
	         
	        if(rs.next()) {
	            dto = new MemberDTO();
	            dto.setName(rs.getString("name"));
	            dto.setId(rs.getString("id"));
	            dto.setPwd(rs.getString("pwd"));
	            dto.setGender(rs.getString("gender"));
	            dto.setEmail1(rs.getString("email1"));
	            dto.setEmail2(rs.getString("email2"));
	            dto.setTel1(rs.getString("tel1"));
	            dto.setTel2(rs.getString("tel2"));
	            dto.setTel3(rs.getString("tel3"));
	            dto.setAddr(rs.getString("addr"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return dto;
	}
	   

	// 회원정보 수정
	public int modify(MemberDTO dto) {
	    int su=0;
	    String sql = "update member set pwd=?, gender=?, email1=?, email2=?,"
	      + "tel1=?, tel2=?, tel3=?, addr=? where id=?";
	    conn = getConnection();
	    try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getPwd());
	         pstmt.setString(2, dto.getGender());
	         pstmt.setString(3, dto.getEmail1());
	         pstmt.setString(4, dto.getEmail2());
	         pstmt.setString(5, dto.getTel1());
	         pstmt.setString(6, dto.getTel2());
	         pstmt.setString(7, dto.getTel3());
	         pstmt.setString(8, dto.getAddr());
	         pstmt.setString(9, dto.getId());
	         
	         su = pstmt.executeUpdate();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
	         close();
	    }
	      return su;
	}
	// 총 회원수 구하기
	public int getTotalMember() {
		int totalMember = 0;
		String sql = "select count(*) as cnt from member";
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalMember = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalMember;
	}
	
	public List<MemberDTO> selectList(int startNum, int endNum) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from "
					+ " (select rownum rn, tt.* from "
					+ " (select * from member order by name asc) tt) "
					+ " where rn>=? and rn<=?";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
	
			while(rs.next()) {	
				MemberDTO dto = new MemberDTO();
	            dto.setName(rs.getString("name"));
	            dto.setId(rs.getString("id"));
	            dto.setPwd(rs.getString("pwd"));
	            dto.setGender(rs.getString("gender"));
	            dto.setEmail1(rs.getString("email1"));
	            dto.setEmail2(rs.getString("email2"));
	            dto.setTel1(rs.getString("tel1"));
	            dto.setTel2(rs.getString("tel2"));
	            dto.setTel3(rs.getString("tel3"));
	            dto.setAddr(rs.getString("addr"));
				dto.setLogtime(rs.getString("logtime"));
				
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





