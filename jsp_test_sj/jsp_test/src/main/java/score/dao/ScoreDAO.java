package score.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import score.dto.ScoreDTO;

public class ScoreDAO {
	
	 Connection conn;
     PreparedStatement pstmt;
     ResultSet rs;
     DataSource ds;  
     
     public ScoreDAO() {
    	 try {
             Context context = new InitialContext();
             ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
          } catch (NamingException e) {
             e.printStackTrace();
          } 
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
     
     //개별적으로 insert할 함수
     public int scoreWrite(ScoreDTO dto) {
        int su=0;
        String sql = "insert into score values (?, ? , ?, ?, ?)";
        
        try {
           conn = ds.getConnection();   // 커넥션풀에서 커넥션 객체1개 얻어오기
           pstmt = conn.prepareStatement(sql);
           pstmt.setString(1, dto.getId());
           pstmt.setString(2, dto.getName());
           pstmt.setInt(3, dto.getKorean());
           pstmt.setInt(4, dto.getEnglish());
           pstmt.setInt(5, dto.getMath());
           
           su = pstmt.executeUpdate(); //insert, update, delete => return 값은 처리된 데이터의 갯수
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           close();
        }
        return su;
     }
     
     // 회원목록보기
     
    
     //회원 총 인원수 구하기
     public int getTotalMember() {
  	   int totallMember = 0;
  	   String sql = "select count(*) as cnt from score";
  	   
  	   try {
  		   	conn = ds.getConnection();
  			pstmt = conn.prepareStatement(sql);
  			
  			rs = pstmt.executeQuery();
  			
  			if(rs.next()) {
  				totallMember = rs.getInt("cnt");
  			}
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} finally {
  			close();
  		}
  	   return totallMember;
     }
     
     //10개씩 목록보기
     public List<ScoreDTO> scoreList(int startNum, int endNum) {
        // 목록 데이터를 저장한 리스트 객체
        List<ScoreDTO> list = new ArrayList<ScoreDTO>();
        String sql = "select * from\n"
        		+ "(select rownum rn, tt.*from\n"
        		+ "(select * from score order by id asc) tt)\n"
        		+ "where rn>=? and rn<=?";
        
        try {
           conn = ds.getConnection();
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, startNum);
           pstmt.setInt(2, endNum); 
           rs = pstmt.executeQuery();
           
           while(rs.next()) {
        	  ScoreDTO dto = new ScoreDTO();
              dto.setId(rs.getString("id"));
              dto.setName(rs.getString("name"));
              dto.setKorean(rs.getInt("korean"));
              dto.setEnglish(rs.getInt("english"));
              dto.setMath(rs.getInt("math"));
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
}
