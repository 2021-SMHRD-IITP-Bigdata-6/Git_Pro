package com.dogpro.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.dogpro.memberDTO.memberDTO;

public class memberDAO {
   Connection conn = null;
   PreparedStatement psmt = null;
   ResultSet rs = null;

   int cnt = 0;
   memberDTO dto = null;
   private boolean check;

   public memberDTO Login(memberDTO dto1) {
      try {
         getConn();
         
         System.out.println(dto1.getId());
         System.out.println(dto1.getPw());
         String sql = "select * from T-MEMBER where m_id = ?";

         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dto1.getId());

         rs = psmt.executeQuery();

         if (rs.next()) {
            String getid = rs.getString(1); // db안의 아이디
            String getpw = rs.getString(2); // pw
            String gettel = rs.getString(3); // tel

            System.out.println(getpw);
            
            if (dto1.getPw().equals(getpw)) {
               dto = new memberDTO(getid, gettel);
            }

         }
      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return dto;
   }

   public int Update(String email, String pw, String tel, String id) {

      try {
         getConn();

         // --------------------DB연결

         String sql = "update t_member set id=?,pw=?,tel=? where id=? ";
         // 5. SQL명령문을 준비
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, pw);
         psmt.setString(2, tel);
         psmt.setString(3, email);
        psmt.setString(4, id);
         // 6. SQL명령문 실행
         cnt = psmt.executeUpdate();

         // 7. 명령 후 처리

      } catch (Exception e) {
         // ClassNotFoundException, SQLException
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return cnt;
   }

   public int Delete(String id) {

      try {
         getConn();

         String sql = "delete from t_member where id = ?";

         psmt = conn.prepareStatement(sql);
         psmt.setString(1, id);

         cnt = psmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();

      } finally {
         close();

      }

      return cnt;
   }

   public void getConn() {
      try {
    	  Class.forName("oracle.jdbc.driver.OracleDriver");
          System.out.println("클래스파일 로딩완료");
          
          //3.DB에서 사용하는 id/pw를 인증
          String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
          String dbid = "cgi_8_2_1216";
          String dbpw = "smhrd2";
          
          conn = DriverManager.getConnection(url, dbid, dbpw);
          
          if(conn!=null) {
             System.out.println("연결성공");
          }else {
             System.out.println("연결실패");
          }

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public void close() {
      System.out.println("무조건실행");
      try {
         if (rs != null) {
            rs.close();
         }
         if (psmt != null) {
            psmt.close();
         }
         if (conn != null) {
            conn.close();
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public int Join(memberDTO dto) {

      try {
         getConn();

         String sql = "insert into t_member values (?, ?, ?,?, sysdate)";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dto.getEmail());
         psmt.setString(2, dto.getPw());
         psmt.setString(3, dto.getTel());
         psmt.setString(4, dto.getId());

         cnt = psmt.executeUpdate();

      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return cnt;

   }

  // public ArrayList<memberDTO> selectMember() {

  //    ArrayList<memberDTO> arr = new ArrayList<memberDTO>();

  //    try {
   //      getConn();

    //     String sql = "select * from t_member";
    //     psmt = conn.prepareStatement(sql);
    //     rs = psmt.executeQuery();

   //      while (rs.next() == true) {
    //        String id = rs.getString(1);
  //          String tel = rs.getString(3);
   //         String nickname = rs.getString(4);

   //      dto = new memberDTO(nickname,id ,pw,tel ,nickname);
   //         arr.add(dto);
   //      }

    //  } catch (Exception e) {
     //    System.out.println("클래스파일 로딩실패");
     //    e.printStackTrace();

   //   } finally {
  //       close();

  //    }
  //    return arr;
 //  }

   public boolean emailChechk(String id) {
      try {
         getConn();
         
      
         String sql = "select * from member_message where id = ?";

         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, id);

         rs = psmt.executeQuery();
         
         check = rs.next();
      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      
      return check;
   }

public ArrayList<memberDTO> searchMember(String id) {
   // TODO Auto-generated method stub
   return null;
}
}