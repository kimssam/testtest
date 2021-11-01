package imageboard.dao;

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

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public ImageboardDAO() {
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
	
	// 데이터 저장
	public int imageboardWrite(ImageboardDTO dto) {
		int su = 0;
		String sql = "insert into imageboard values (seq_imageboard.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
				
		try {
			conn = ds.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImageId());
			pstmt.setString(2, dto.getImageName());
			pstmt.setInt(3, dto.getImagePrice());
			pstmt.setInt(4, dto.getImageQty());
			pstmt.setString(5, dto.getImageContent());
			pstmt.setString(6, dto.getImage1());
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
	
	// 5개씩 목록보기
	public List<ImageboardDTO> imageboardList(int startNum, int endNum) {
		// 목록 데이터를 저장한 리스트 객체
		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		String sql = "select * from "
				   + " (select rownum rn, tt.* from "
				   + " (select * from imageboard order by seq desc) tt) "
				   + " where rn>=? and rn<=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ImageboardDTO dto = new ImageboardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));;
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
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
	
	// 총목록수 구하기
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) as cnt from imageboard";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalA = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return totalA;
	}
	
	// 상세보기
	public ImageboardDTO boardView(int seq) {
		ImageboardDTO dto = null;
		String sql = "select * from imageboard where seq=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ImageboardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));;
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
				dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
				close();
		}
		return dto;
	}
	
	// 삭제
	public int imageboardDelete(int seq) {
		int result = 0;
		String sql = "delete imageboard where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 수정 기능
	public int imageboardModify(ImageboardDTO dto) {
		int su =0;
	    String sql = "";
	    if(dto.getImage1() != null) {	    		
	    	sql = "update imageboard set imageId=?, imageName=?, imagePrice=?, "
	    		+ "imageQty=?, imageContent=?, image1=? where seq=?";
	    } else {
	    	sql = "update imageboard set imageId=?, imageName=?, imagePrice=?, "
		    		+ "imageQty=?, imageContent=? where seq=?";
	    }
	    
	    try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImageId());
			pstmt.setString(2, dto.getImageName());
			pstmt.setInt(3, dto.getImagePrice());
			pstmt.setInt(4, dto.getImageQty());
			pstmt.setString(5, dto.getImageContent());
			if(dto.getImage1() != null) {
				pstmt.setString(6, dto.getImage1());
				pstmt.setInt(7, dto.getSeq());
			} else {
				pstmt.setInt(6, dto.getSeq());
			}
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	    return su;
	}	
}
