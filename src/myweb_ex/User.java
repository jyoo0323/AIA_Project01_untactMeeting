package myweb_ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class User {
	private final static String IDEXIST = "SELECT * FROM USER WHERE ID=?";
	private static String LOGIN[] = {"SELECT * FROM USER WHERE ID=", " AND PWD="};
	private static PreparedStatement pstmt;
	private static Connection conn;
	private static ResultSet rs;	
	private static Statement stmt;
	private static JDBCutils jdbc;
	
	public static void main(String[] args) {
		String ans = findID("김사장","사장","1111");
		System.out.println(ans);
	}
	public static String findID(String name, String pos, String code) {
		String ans = "";
		String FIND = "SELECT ID FROM USER WHERE NAME=? AND POSITION=? AND CODE=?";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			pstmt = conn.prepareStatement(FIND);
			pstmt.setString(1, name);
			pstmt.setString(2, pos);
			pstmt.setString(3, code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ans = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close(conn, pstmt, rs);;
		}
		return ans;
	}
	public static List<String> getAllUsers() {
		List<String> users = new ArrayList<String>();
		String SELECT_ALL = "SELECT * FROM USER";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SELECT_ALL);
			
			while(rs.next()) {
				users.add(rs.getString("NAME")+" "+rs.getString("POSITION"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbc.close(conn);
			jdbc.close(stmt);
		}
		
		return users;
		
	}
	
	public static boolean login(String id, String pwd) {
		String LOGINinfo = LOGIN[0]+"'"+id+"'"+LOGIN[1]+"'"+pwd+"'";
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(LOGINinfo);
			
			if(rs.next()) {
				return true;
			}
			
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			jdbc.close(conn, stmt, rs);
		}
		return false;
	}
	
	public static String getNameAndPos(String id) {
		String name = "SELECT NAME FROM USER WHERE ID='"+id+"'";
		String pos = "SELECT POSITION FROM USER WHERE ID='"+id+"'";
		String res = "";
		
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			for(int i =0; i<2; i++) {
				stmt = conn.createStatement();
				if(i==0) {
					rs = stmt.executeQuery(name);
					if(rs.next()) {
						String nm = rs.getString("NAME");
						res += nm+" ";
					}
				}else {
					rs = stmt.executeQuery(pos);
					if(rs.next()) {
						String ps = rs.getString("POSITION");
						res += ps;
					}
				}
			}
			System.out.println(res);
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			jdbc.close( conn, stmt, rs);
		}
		return res;
	}
	
	
	public static boolean checkId(String id) {
		jdbc = new JDBCutils();
		conn = jdbc.getConnection();
		
		try {
			pstmt = conn.prepareStatement(IDEXIST);
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			
			if(cnt >= 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			jdbc.close(conn);
			jdbc.close(pstmt);
		}
		
		return false;
	}
}
