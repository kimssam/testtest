package board.dao;

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

import board.bean.BoardBean;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	public BoardDAO() {
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

	// 데이터 저장
	public int boardWrite(BoardBean bean) {
		int su = 0;
		String sql = "INSERT INTO board2 VALUES "
				+ "(seq_num.NEXTVAL, ?, ?, ?, ?, ?, seq_num.CURRVAL, 0, 0, 0, sysdate)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBoard_name());
			pstmt.setString(2, bean.getBoard_pass());
			pstmt.setString(3, bean.getBoard_subject());
			pstmt.setString(4, bean.getBoard_content());
			pstmt.setString(5, bean.getBoard_file());

			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 5개씩 목록보기
	public List<BoardBean> boardList(int startNum, int endNum) {
		// 목록 데이터를 저장한 리스트 객체
		List<BoardBean> list = new ArrayList<BoardBean>();
		String sql = "select * from "
				   + " (select rownum rn, tt.* from "
				   + " (select * from board2 order by board_re_ref desc, board_re_seq asc) tt) "
				   + " where rn>=? and rn<=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setBoard_num(rs.getInt("board_num"));
				bean.setBoard_name(rs.getString("board_name"));
				bean.setBoard_pass(rs.getString("board_pass"));
				bean.setBoard_subject(rs.getString("board_subject"));
				bean.setBoard_content(rs.getString("board_content"));
				bean.setBoard_file(rs.getString("board_file"));
				bean.setBoard_re_ref(rs.getInt("board_re_ref"));
				bean.setBoard_re_lev(rs.getInt("board_re_lev"));
				bean.setBoard_re_seq(rs.getInt("board_re_seq"));
				bean.setBoard_readcount(rs.getInt("board_readcount"));
				String str = rs.getString("board_date");
				bean.setBoard_date(str.substring(0, str.indexOf(" ")));
				// 리스트에 저장
				list.add(bean);
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
		String sql = "select count(*) as cnt from board2";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalA = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return totalA;
	}

	// 상세보기
	public BoardBean boardView(int board_num) {
		BoardBean bean = null;
		String sql = "select * from board2 where board_num = ?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bean = new BoardBean();
				bean.setBoard_num(rs.getInt("board_num"));
				bean.setBoard_name(rs.getString("Board_name"));
				bean.setBoard_pass(rs.getString("board_pass"));
				bean.setBoard_subject(rs.getString("board_subject"));
				bean.setBoard_content(rs.getString("board_content"));
				bean.setBoard_file(rs.getString("board_file"));
				bean.setBoard_re_ref(rs.getInt("board_re_ref"));
				bean.setBoard_re_lev(rs.getInt("board_re_lev"));
				bean.setBoard_re_seq(rs.getInt("board_re_seq"));
				bean.setBoard_readcount(rs.getInt("board_readcount"));
				String str = rs.getString("board_date");
				bean.setBoard_date(str.substring(0, str.indexOf(" ")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return bean;
	}

	// 삭제하기
	public int boardDelete(int board_num, String board_pass) {
		int su = 0;
		String sql = "delete board2 where board_num=? and board_pass=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);

			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}

	// 수정
	public int boardModify(BoardBean bean) {
		int su = 0;
		String sql = "update board2 set board_name=?, board_subject=?, "
				   + " board_content=? where board_num=? and board_pass=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBoard_name());
			pstmt.setString(2, bean.getBoard_subject());
			pstmt.setString(3, bean.getBoard_content());
			pstmt.setInt(4, bean.getBoard_num());
			pstmt.setString(5, bean.getBoard_pass());

			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
	
	// 답글 저장
	public int insertReplyArticle(BoardBean bean) {
		int su = 0;
		String sql = "";
		int re_ref = bean.getBoard_re_ref();
		int re_lev = bean.getBoard_re_lev();
		int re_seq = bean.getBoard_re_seq();
		
		try {
			conn = ds.getConnection();
			// 기존 답글의 등록순서를 재정리
			// => 원글 re_seq보다 큰 답글 re_seq를 1씩 증가
			sql = "update board2 set board_re_seq = board_re_seq+1 "
				+ " where board_re_ref=? and board_re_seq>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, re_ref);
			pstmt.setInt(2, re_seq);
			pstmt.executeUpdate();
			
			// 추가되는 답글의 re_seq는 원글 re_seq에 1증가한 값
			// 추가되는 답글의 re_lev는 원글 re_lev에 1증가한 값
			re_seq += 1;
			re_lev += 1;
			sql = "insert into board2 values "
				+ " (seq_num.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBoard_name());
			pstmt.setString(2, bean.getBoard_pass());
			pstmt.setString(3, bean.getBoard_subject());
			pstmt.setString(4, bean.getBoard_content());
			pstmt.setString(5, " ");   // 파일명은 없음, 공백문자1개 넣어야함
			pstmt.setInt(6, re_ref);
			pstmt.setInt(7, re_lev);
			pstmt.setInt(8, re_seq);
			
			su = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return su;
	}
}






