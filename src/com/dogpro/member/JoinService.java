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

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String nickname = request.getParameter("nickname");

		memberDTO dto = new memberDTO(id, pw, tel,nickname);

		memberDAO dao = new memberDAO();
		int cnt = dao.Join(dto);

		// 7. 명령 후 처리
		if (cnt > 0) {

			request.setAttribute("dto", dto);

			RequestDispatcher dis = request.getRequestDispatcher("joinSuccess.jsp");
			
			dis.forward(request, response);

		} else {

		}

		return null;
	}
}
