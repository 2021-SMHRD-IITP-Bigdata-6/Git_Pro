package com.dogpro.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogpro.memberDAO.memberDAO;
import com.inter.Command;

public class DeleteService implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("delete_email");
		System.out.println("삭제하는 이메일: " + email);

		request.setCharacterEncoding("euc-kr");
		
		memberDAO dao = new memberDAO();

		int cnt = dao.Delete(email);

		return "selectMember.jsp";
				
		
	}

	
	
}
