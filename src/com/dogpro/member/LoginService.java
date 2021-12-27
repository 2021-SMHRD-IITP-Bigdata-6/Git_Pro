package com.dogpro.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.memberDTO;
import com.inter.Command;

public class LoginService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		memberDAO dao = new memberDAO();
		// membedrDAO에서 넘어오는 DTO값을 받아서
		// DTO가 null이 아니었을 때는 로그인처리를 하고
		// DTO가 null이었을때는 'LoginFalse.jsp'로 이동

		memberDTO dto1 = new memberDTO(id, pw);

		memberDTO dto = dao.Login(dto1);

		String nextpage = "";
		
		
		if (dto != null) {
			// 하나로 묶어보기 = 배열? dto!
			// 세 변수 dto로 묶기
			// 2번 실행 1번 실행
			// 코드는 오른쪽에서 왼쪽으로 읽는다

			HttpSession session = request.getSession();
//         session.setAttribute("email", email);
//         session.setAttribute("tel", gettel);
//         session.setAttribute("address", getaddress);

			// dto 쓰면 위에 처럼 따로 따로 쓸 필요 없이
			session.setAttribute("dto", dto);
			// 이렇게 쓰면 단순 간편!
			nextpage = "MainPage.html";
		} else {
			nextpage = "LoginFalse.jsp";
		}
		return nextpage;
	}
}
