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

		String id = dto.getId();
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		memberDAO dao = new memberDAO();
		int cnt = dao.Update(nickname, pw, tel, email);

		if (cnt > 0) {
			memberDTO update_dto = new memberDTO(nickname, pw, tel, email);
			session.setAttribute("dto", update_dto);
			response.sendRedirect("main.jsp");
		} else {

		}
		
		return null;
	}

}
