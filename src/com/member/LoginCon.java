package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.memberDTO;
import com.message.DAO.memberDAO1;
import com.message.DTO.memberDTO1;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      
      request.setCharacterEncoding("utf-8");
      
      String id = request.getParameter("id");      
      String pw = request.getParameter("pw");
      memberDAO dao = new memberDAO();
      memberDTO dto1 = new memberDTO(id, pw);
      memberDTO dto = dao.Login(dto1);

      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         System.out.println("클래스파일 로딩완료");
         
         String url = "jdbc:oracle:thin:@127.0.0.1:1521";
         String dbid = "hr";
         String dbpw = "hr";
         
         conn = DriverManager.getConnection(url, dbid, dbpw);
         
         if(conn!=null) {
            System.out.println("연결성공");
         }else {
            System.out.println("연결실패");
         }
         
         String sql = "select * from dogpro where id=? and pw=?";
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, id);
         psmt.setString(2, pw);
         
         rs = psmt.executeQuery();

         if(rs.next() == true) {
            String uid = rs.getString("id");
            
            HttpSession session = request.getSession();            
            session.setAttribute("id", id);
            
            response.sendRedirect("index.html");
                        
         } else {
            
         }
            

         
      }catch(Exception e) {
         //ClassNotFoundException, SQLException
         System.out.println("클래스파일 로딩실패");
         e.printStackTrace();
         
      }finally {
         System.out.println("무조건실행");
         try {
            if(psmt!=null) {
               psmt.close();
            }
            if(conn!=null) {
               conn.close();
            }
         }catch (Exception e) {
            e.printStackTrace();
         }
         
      }String nextpage = "";

		if (dto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("dto", dto);

			nextpage = "main.jsp";
		} else {
			nextpage = "LoginFalse.jsp";
		}
		return nextpage;
   }

}