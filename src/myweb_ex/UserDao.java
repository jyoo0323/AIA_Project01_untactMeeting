package myweb_ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDao {
   
   private static Connection conn = null;
   private static PreparedStatement pstmt = null;
   private static ResultSet rs = null;
   private static JDBCutils jdbc = null;
   
   static String INSERT = "INSERT INTO USER VALUES(?,?,?,?,?,?)";
   
   
   public static boolean insert(SignUp su) {
      jdbc = new JDBCutils();
      conn = jdbc.getConnection();
      System.out.println("connected");
      try {
         pstmt = conn.prepareStatement(INSERT);
         pstmt.setString(1, su.getId());
         pstmt.setString(2, su.getPassword());
         pstmt.setString(3, su.getName());
         pstmt.setString(4, su.getPosition());
         pstmt.setString(5, su.getCode());
         pstmt.setString(6, su.getGender());
         
         int cnt = pstmt.executeUpdate();
         if(cnt > 0) {
            System.out.println("UserDao 저장 완료!");
            conn.commit();
            return true;
         } else {
            System.out.println("저장 실패!");
            conn.rollback();
         }
      } catch (SQLException e) {
         System.out.println("저장 실패!");
         try {
            conn.rollback();
         } catch (SQLException e1) {
            e1.printStackTrace();
         }
         e.printStackTrace();
      } finally {
    	 jdbc.close(conn, pstmt, rs);
      }
      return false;
      
      
   }

}
