package com.dogpro.memberDAO;

import com.dogpro.memberDTO.memberDTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
         String sql = "select * from t_member where id = ?";

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
               //짠 오류 해결
               //생성자를 사용할껀데
               //현제 구현 되어있는 생성자를 보니
               //id 와 tel 을 받는 생성자 가 없어서 오류가 났어요!....?다 같이 만들었었느넫..감사합니다!
               //네넵 잘 안되면 더 불러주세용 넵! 알겠습니다
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

   public int Update(String id, String pw, String tel, String email) {

      try {
         getConn();

         // --------------------DB연결

         String sql = "update t_member set pw=?,tel=?,email=? where id=? ";
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

         String url = "jdbc:oracle:thin:@127.0.0.1:1524";
         String dbid = "cgi_8_2_1216";
         String dbpw = "smrth2";

         conn = DriverManager.getConnection(url, dbid, dbpw);

         if (conn != null) {
            System.out.println("연결성공");
         } else {
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
         
         psmt.setString(1, dto.getId());
         psmt.setString(2, dto.getPw());
         psmt.setString(3, dto.getTel());
         psmt.setString(4, dto.getEmail());

         cnt = psmt.executeUpdate();

      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return cnt;

   }

   public ArrayList<memberDTO> selectMember() {

      ArrayList<memberDTO> arr = new ArrayList<memberDTO>();

      try {
         getConn();

         String sql = "select * from t_member";
         psmt = conn.prepareStatement(sql);
         rs = psmt.executeQuery();

         while (rs.next() == true) {
            String id = rs.getString(1);//id
            String tel = rs.getString(2);//tell
            String pw = rs.getString(3);//tell
            String email = rs.getString(4);//tell
            String nickname = rs.getString(5);//nickname 
           //이렇게 3개의 값만 가지고 오니까
            //memberDTO 객체를 만들기 위해서는
            //pw, email 이라는 데이터가 더필요해서 가져와 줘야해용!

			dto = new memberDTO(id, pw, nickname, tel, email);
            arr.add(dto);
         }

      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return arr;
   }

   public boolean emailChechk(String id) {
      try {
         getConn();
         
      
         String sql = "select * from t_member where id = ?";

         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, id);
         //우선 오류가 생긴 이유는
         //sql 문에 있는 ? 공간에 id 라는 변수 값을 넣어줄게요 라고 말하고 있는데
         //현제 여기 메소드 내에서는 id 라는 변수 가 없어서 오류가 나오있습니답!

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