package com.dogpro.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.memberDTO;
import com.inter.Command;

public class UpdateService implements Command{

   @Override
   public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      HttpSession session = request.getSession();
      memberDTO dto = (memberDTO) session.getAttribute("dto");
      
      String page=null;
      String id = dto.getId();
      
      
      //사용자가 변경하려는 값 아래 6개 
      
      String nick = request.getParameter("m_nick");
      String tel = request.getParameter("m_tel");
      String dogname = request.getParameter("m_dogname");
      String dogkind = request.getParameter("m_dogkind");
      String dogage = request.getParameter("m_dogage");
      String dogweight = request.getParameter("m_dogweight");
      String adoptdate = request.getParameter("m_adoptdate");
      
      memberDAO dao = new memberDAO();
      int cnt = dao.Update(nick,tel,dogname,dogkind,dogage,dogweight,adoptdate,id);
      System.out.println("testtest1");
      if (cnt > 0) {
         memberDTO update_dto = new memberDTO(dogkind, dogage, dogweight, dogname, nick, tel, adoptdate);
         //memberDTO update_dto = new memberDTO(nick,tel,dogname,dogkind,dogage,dogweight);
         session.removeAttribute("dto");
         session.setAttribute("dto", update_dto);
         page = "Mypage_Firstjsp.jsp";
         
      } else {
         System.out.println("testtest");
         
      }
      
      return page;
      
      
   }

}