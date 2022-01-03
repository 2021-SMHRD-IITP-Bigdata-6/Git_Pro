package com.dogpro.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.foodDTO;
import com.dogpro.memberDTO.memberDTO;
import com.inter.Command;

public class LoginService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{

		System.out.println("[LoginService]");
		 request.setCharacterEncoding("UTF-8");
	      String id = request.getParameter("m_id");
	  
	      String pw = request.getParameter("m_pw");
	  
	      System.out.println("id : "+id);
	      System.out.println("pw : "+pw);
	      memberDAO dao = new memberDAO();
	      memberDTO dto1 = new memberDTO(id, pw);
	      memberDTO dto = dao.Login(dto1, request);
	      
	      // memberDAO에서 넘어오는 DTO값을 받아서
	      // DTO가 null이 아니었을때는 로그인처리를 하고
	      // DTO가 null이었을때는 'LoginFalse.jsp로 이동하게 하시오.

	      String nextpage = "";

	      if (dto != null) {
	         HttpSession session = request.getSession();
	         session.setAttribute("dto", dto);

	         nextpage = "Mainpage.jsp";
	      } else {
	    	  nextpage = "LoginFalse.jsp";
	      }
	      return nextpage;
	   }

	}