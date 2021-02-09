package myweb_ex;

import java.sql.Connection;
import socket.SocketTools;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class User {
	private final static String IDEXIST = "SELECT * FROM USER WHERE ID=?";
	private static String LOGIN[] = {"SELECT * FROM USER WHERE ID=", " AND PWD="};
	//private final String SIGNUP = "INSERT INTO USER VALUES(?, ? )";
	private static PreparedStatement pstmt;
	private static Connection conn;
	private static ResultSet rs;	
	private static Statement stmt;
	private static JDBCutils jdbc;
	
	public static boolean login(String id, String pwd) {
		String LOGINinfo = LOGIN[0]+"'"+id+"'"+LOGIN[1]+"'"+pwd+"'";
		System.out.println(LOGINinfo);
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
			jdbc.close(rs, stmt, conn);
		}
		return false;
	}
	
	
	public static void signUp(String id, String pwd) {
		
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
						res += "["+ps+"]";
					}
				}
			}
			System.out.println(res);
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			jdbc.close(rs, stmt, conn);
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
