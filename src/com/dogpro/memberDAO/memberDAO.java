package com.dogpro.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dogpro.memberDTO.foodDTO;
import com.dogpro.memberDTO.memberDTO;

public class memberDAO {
   Connection conn = null;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   String sql = "";
   int cnt = 0;
   int cnt1 = 0;
   memberDTO dto = null;
   foodDTO fdto = null;
   private boolean check;
   private String id;
   ArrayList<foodDTO> farr = new ArrayList<foodDTO>();
   
   public memberDTO Login(memberDTO dto1,HttpServletRequest request) {
      
      try {
         getConn();
         
         System.out.println("Login 메소드입니다.");
         System.out.println("무슨 id?" + dto1.getId()); // DB 에서 가져온 id값
         System.out.println("무슨 pw?" + dto1.getPw()); // DB 에서 가져온 pw값
         sql = "select * from t_member where m_id= ? and m_pw= ?";

         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dto1.getId());
         psmt.setString(2, dto1.getPw());

         rs = psmt.executeQuery();

         if (rs.next()) {
            String getid = rs.getString(1); // db안의 아이디
            String getpw = rs.getString(2); // pw
            String m_nick = rs.getString(3); // nickName
            String m_phone = rs.getString(4);// 휴대폰 번호
            String m_dogKind = rs.getString(5); // 로그인한 개종류 가져오는것
            String dog_name = rs.getString(6);
            String m_dogWeight = rs.getString(7);
            String m_dogAge = rs.getString(8);
            String date = rs.getString(9);
            String file = rs.getString(10);

            System.out.println(getid);
            System.out.println(getpw);

            if (dto1.getPw().equals(getpw)) {
               dto = new memberDTO(getid, getpw, m_nick, m_phone, m_dogKind, dog_name, m_dogWeight, m_dogAge, date, file);
   
               HttpSession session = request.getSession();
               session.setAttribute("dto", dto);
               
               sql = "select * from t_food ";

               psmt = conn.prepareStatement(sql);

               rs = psmt.executeQuery();
               
               while (rs.next()) {
                  
               
               
               String f_SEQ = rs.getString(1);
               String f_NAME = rs.getString(2);
               String f_TYPE = rs.getString(3);
               String f_VITAMIN = rs.getString(4);
               String f_ANTIOXIDATION = rs.getString(5);
               String f_APPETITE = rs.getString(6);
               String f_NUTRITION = rs.getString(7);
               String f_STONE = rs.getString(8);
               String f_HUMIDITY = rs.getString(9);
               String f_MOUTH = rs.getString(10);
               String f_SMELL = rs.getString(11);
               String f_DIET = rs.getString(12);
               String f_NEUTRAL = rs.getString(13);
               String f_INDOOR = rs.getString(14);
               String f_TEAR = rs.getString(15);
               String f_EYE = rs.getString(16);
               String f_ALLERGY = rs.getString(17);
               String f_SKIN = rs.getString(18);
               String f_FUR = rs.getString(19);
               String f_URINATION = rs.getString(20);
               String f_BONE = rs.getString(21);
               String f_PERFORMANCE = rs.getString(22);
               String f_DIGESTIVE = rs.getString(23);
               String f_TOOTH = rs.getString(24);
               String f_WEIGHT = rs.getString(25);
               String f_REMEDY = rs.getString(26);
               String f_KIDNEY = rs.getString(27);
               String f_SITE = rs.getString(28);
               String f_PRICE = rs.getString(29);
               String f_IMG = rs.getString(30);

               fdto = new foodDTO(f_SEQ, f_NAME, f_TYPE, f_VITAMIN, f_ANTIOXIDATION, f_APPETITE, f_NUTRITION,
                     f_STONE, f_HUMIDITY, f_MOUTH, f_SMELL, f_DIET, f_NEUTRAL, f_INDOOR, f_TEAR, f_EYE,
                     f_ALLERGY, f_SKIN, f_FUR, f_URINATION, f_BONE, f_PERFORMANCE, f_DIGESTIVE, f_TOOTH,
                     f_WEIGHT, f_REMEDY, f_KIDNEY, f_SITE, f_PRICE, f_IMG);
               session.setAttribute("fdto", fdto);
            }
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

   public int Update(String nick, String tel, String dogname, String dogkind, String dogage, String dogweight,
         String adoptdate, String id) {

      try {
         getConn();

         // --------------------DB연결
         int numAge = Integer.parseInt(dogage);
         int numWeight = Integer.parseInt(dogweight);
         String sql = "update t_member set m_nick=?,m_phone=?,m_dogname=?,m_dog=?,m_dogweight=?, m_dogage=?, adoptdate=? where m_id=?";
         // 5. SQL명령문을 준비
         psmt = conn.prepareStatement(sql);

         psmt.setString(1, nick);
         psmt.setString(2, tel);
         psmt.setString(3, dogname);
         psmt.setString(4, dogkind);
         psmt.setInt(5, numAge);
         psmt.setInt(6, numWeight);
         psmt.setString(7, adoptdate);
         psmt.setString(8, id);

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

   public int Join(memberDTO dto) {

      try {
         getConn();
         System.out.println("===Join===");
         String sql = "insert into t_member values (?, ?, ?,?,?,?,?,?,?,null)";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dto.getId());
         psmt.setString(2, dto.getPw());
         psmt.setString(3, dto.getNickname());
         psmt.setString(4, dto.getTel());
         psmt.setString(6, dto.getDogkind());
         psmt.setString(5, dto.getDogname());
         psmt.setString(8, dto.getDogweight());
         psmt.setString(7, dto.getDogage());
         psmt.setString(9, dto.getDate());

         cnt = psmt.executeUpdate();

      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return cnt;

   }

   public ArrayList<foodDTO> selectFood() {

      ArrayList<foodDTO> arr = new ArrayList<foodDTO>();

      try {
         getConn();

         String sql = "select * from t_food order by f_price ";
         psmt = conn.prepareStatement(sql);
         rs = psmt.executeQuery();

         while (rs.next() == true) {
            String f_SEQ = rs.getString(1);
            String f_NAME = rs.getString(2);
            String f_TYPE = rs.getString(3);
            String f_VITAMIN = rs.getString(4);
            String f_ANTIOXIDATION = rs.getString(5);
            String f_APPETITE = rs.getString(6);
            String f_NUTRITION = rs.getString(7);
            String f_STONE = rs.getString(8);
            String f_HUMIDITY = rs.getString(9);
            String f_MOUTH = rs.getString(10);
            String f_SMELL = rs.getString(11);
            String f_DIET = rs.getString(12);
            String f_NEUTRAL = rs.getString(13);
            String f_INDOOR = rs.getString(14);
            String f_TEAR = rs.getString(15);
            String f_EYE = rs.getString(16);
            String f_ALLERGY = rs.getString(17);
            String f_SKIN = rs.getString(18);
            String f_FUR = rs.getString(19);
            String f_URINATION = rs.getString(20);
            String f_BONE = rs.getString(21);
            String f_PERFORMANCE = rs.getString(22);
            String f_DIGESTIVE = rs.getString(23);
            String f_TOOTH = rs.getString(24);
            String f_WEIGHT = rs.getString(25);
            String f_REMEDY = rs.getString(26);
            String f_KIDNEY = rs.getString(27);
            String f_SITE = rs.getString(28);
            String f_PRICE = rs.getString(29);
            String f_IMG = rs.getString(30);


            fdto = new foodDTO(f_SEQ, f_NAME, f_TYPE, f_VITAMIN, f_ANTIOXIDATION, f_APPETITE, f_NUTRITION,
                  f_STONE, f_HUMIDITY, f_MOUTH, f_SMELL, f_DIET, f_NEUTRAL, f_INDOOR, f_TEAR, f_EYE,
                  f_ALLERGY, f_SKIN, f_FUR, f_URINATION, f_BONE, f_PERFORMANCE, f_DIGESTIVE, f_TOOTH,
                  f_WEIGHT, f_REMEDY, f_KIDNEY, f_SITE, f_PRICE, f_IMG);
            arr.add(fdto);
         }

      } catch (Exception e) {
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();

      } finally {
         close();

      }
      return arr;
   }

   public boolean idChechk(String id) { // id중복체크
      try {
         getConn();


         String sql = "select * from t_member where m_id = ?";

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
   

   public void getConn() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";

         System.out.println("클래스파일 로딩완료");

         // 3.DB에서 사용하는 id/pw를 인증
         String dbid = "cgi_8_2_1216";
         String dbpw = "smhrd2";

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

   public ArrayList<memberDTO> searchMember(String email) {
      // TODO Auto-generated method stub
      return null;
   }
}