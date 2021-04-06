package myweb_ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class Dashboard {
	private static Connection conn;
	private static ResultSet rs;	
	private static Statement stmt;
	private static JDBCutils jdbc;
	private static PreparedStatement pstmt;
	
	
	public static void deletePost(String id, String content) {
		String DELETE = "DELETE FROM DASHBOARD WHERE WRITER=? AND CONTENTS=?";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setString(2, content);
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			System.out.println("Visited 1 cnt = "+ cnt);
			if(cnt >= 1) {
				conn.commit();
				System.out.println("Visited");
			} else {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbc.close(conn, pstmt, rs);
		}
		
	}
	
	public static void insertPost(String id, String contents) {
		String INSERT = "INSERT INTO DASHBOARD VALUES(?,?)";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, id);
			pstmt.setString(2, contents);
			int cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				conn.commit();
			} else {
				conn.rollback();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			jdbc.close(conn, pstmt, rs);
		}
		
	}
	
	public static HashMap<Integer,String[]> getAllContents() {
		String contents = "SELECT * FROM dashboard";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		int idx = 0;
		HashMap<Integer, String[]> map = new HashMap<Integer, String[]>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(contents);
			while(rs.next()) {
				map.put(idx++,new String[] {rs.getString("WRITER"), rs.getString("CONTENTS")});
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close(conn, stmt, rs);
		}
		return map;
	}
	
	public static void main(String[] args) {
		insertPost("김사장 사장", "테스트!");
	}
}
