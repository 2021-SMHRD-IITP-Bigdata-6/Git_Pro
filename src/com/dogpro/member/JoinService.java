package com.dogpro.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.memberDTO;
import com.inter.Command;

public class JoinService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("m_id1");
		String pw = request.getParameter("m_pw1");
		String nickname = request.getParameter("m_nick");
		String tel = request.getParameter("m_tel");
		String dogname = request.getParameter("m_dogname");
		String dog = request.getParameter("m_dog");
		String dogage = request.getParameter("m_dogage");
		String dogweight = request.getParameter("m_dogweight");
		

		memberDTO dto = new memberDTO(id, pw, tel,nickname,dogname, dog, dogage, dogweight);
		memberDAO dao = new memberDAO();
		int cnt = dao.Join(dto);
		// 7. 명령 후 처리
		if (cnt > 0) {

			request.setAttribute("dto", dto);

			RequestDispatcher dis = request.getRequestDispatcher("Mainpage.jsp");
			
			dis.forward(request, response);

		} else {

		}

		return null;
	}
}
