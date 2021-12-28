package com.dogpro.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dogpro.member.DeleteService;
import com.dogpro.member.JoinService;
import com.dogpro.member.LoginService;
import com.dogpro.member.LogoutService;
import com.dogpro.member.UpdateService;
import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.memberDTO;
import com.google.gson.Gson;
import com.inter.Command;

@WebServlet("*.do")
// action -> a.do , b.do
public class Frontcontroller extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// FrontController Pattern
		// 1. 모든 요청을 하나의Servlet로 정의하는 패턴
		// 2. 중복되는 코드나 추적 , 보안을 적용할 때 하나의 Servlet에서 정의되기때문에에
		// 유지보수에 용이

		System.out.println("[Frontcontroller]");
		String uri = request.getRequestURI();
		System.out.println(uri);
		String path = request.getContextPath();
		System.out.println(path);
		String command = uri.substring(path.length() + 1);
		System.out.println("요청url : " + command);

		Command com = null;
		String nextpage = null;
		
		if (command.equals("LoginCon2.do")) {
				com = new LoginService();
				System.out.println("로그인서비스 통과");
				  nextpage = com.execute(request, response);
		}
			// Command Pattern
			// 사용자의 요청을 객체인 클래스 파일로 처리
			else if (command.contentEquals("JoinCon.do")) {

				com = new JoinService();
				com.execute(request, response);

			} else if(command.equals("searchMember.do")) {
				 String email = request.getParameter("email");
				 memberDAO dao = new memberDAO();
				
				 ArrayList<memberDTO> list = dao.searchMember(email);
				 
				 Gson gson =new Gson();
				 
				 String json = gson.toJson(list);
				 
				 response.setCharacterEncoding("utf-8");
				 
				 PrintWriter out = response.getWriter();
				 out.print(json);
			}
		
		 else if (command.equals("DeleteCon.do")) {
			 com = new DeleteService();
			 nextpage=  com.execute(request, response);
		
			 
		} else if (command.equals("LogoutCon.do")) {
			com = new LogoutService();
			nextpage =com.execute(request, response);
			
			
		} else if (command.equals("UpdateCon.do")) {

			com = new UpdateService();
			com.execute(request, response);

		}

		else if (command.equals("check.do")) {
			// 1, 파라미터 수집
			String email = request.getParameter("email");
			// 2. DAO 객체 생성
			memberDAO dao = new memberDAO();
			// 3. DAO 객체의 메서드 사용
			boolean check = dao.emailChechk(email);
			// 4 PR객체 생성
			PrintWriter out = response.getWriter();
			// 5 응답
			out.print(check);

		} if(nextpage !=null) {
			
			response.sendRedirect(nextpage);
		}
	}
}
