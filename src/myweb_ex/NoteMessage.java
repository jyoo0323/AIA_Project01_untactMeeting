package myweb_ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NoteMessage {
	private static Connection conn;
	private static ResultSet rs;	
	private static Statement stmt;
	private static JDBCutils jdbc;
	private static PreparedStatement pstmt;
	
	public static void deleteMessage(String receiver, String content) {
		String DEL = "DELETE FROM ROOMS WHERE RECEIVER=? AND CONTENTS=?";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		try {
			pstmt = conn.prepareStatement(DEL);
			pstmt.setString(1, receiver);
			pstmt.setString(2, content);
			int cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close(conn, pstmt, rs);
		}
		
	}
	public static void sendMessage(String sender, String receiver, String content) {
		String INSERT = "INSERT INTO ROOMS VALUES(?,?,?)";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		try {
			pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, sender);
			pstmt.setString(2, receiver);
			pstmt.setString(3, content);
			int cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				conn.commit();
			} else {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close(conn, stmt, rs);
		}
	}
	
	public static List<String[]> getAllMessages(String id) {
		String contents = "SELECT * FROM ROOMS WHERE RECEIVER="+"'"+id+"'";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		List<String[]> list = new ArrayList<String[]>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(contents);
			while(rs.next()) {
				list.add(new String[] {rs.getString("SENDER"), rs.getString("CONTENTS")});
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close(conn, stmt, rs);
		}
		return list;
	}
	
	public static void main(String[] args) {
		String contents = "SELECT * FROM ROOMS WHERE SENDER='김사장 사장' AND RECEIVER='김사장 사장'";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		List<String> res = new ArrayList<String>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(contents);
			
			while(rs.next()) {
				res.add(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close(conn, stmt, rs);
		}
		
		for(String content : res) {
			System.out.println(content);
		}
	}
}
