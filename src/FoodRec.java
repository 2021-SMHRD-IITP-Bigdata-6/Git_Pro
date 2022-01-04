import java.io.IOException;
import java.io.PrintWriter;
//import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.util.Arrays;

import com.dogpro.memberDAO.dogDAO;
import com.dogpro.memberDAO.memberDAO;
import com.dogpro.memberDTO.foodDTO;
import com.dogpro.memberDTO.memberDTO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/FoodRec")
public class FoodRec extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 원본
//		dogDAO dao = new dogDAO();
//		ArrayList<foodDTO> puppyRec = dao.puppyRec();
//		Gson gson = new Gson();
//		String json = gson.toJson(puppyRec);
//		
//		System.out.println(json);
//		response.setCharacterEncoding("utf-8");
//		PrintWriter out = response.getWriter();
//		out.print(json);
		
		
		// if문
		
		String agerange = request.getParameter("dogage");
		System.out.println("강아지의 나이 :" + agerange);
		
		
//		memberDTO dto = new memberDTO(null); //?
//		HttpSession session = request.getSession();
//		session.setAttribute("dto",dto);
//		
//		memberDTO dto1 = (memberDTO) session.getAttribute("dto");
//		String agerange1 = dto1.getDogage();

		dogDAO dao = new dogDAO();
		Gson gson = new Gson();
		String json = null;
		ArrayList<foodDTO> ageRange = null;

		if (Integer.parseInt(agerange) <= 1) {

			ageRange = dao.puppyRec();
			json = gson.toJson(ageRange);

		} else if (Integer.parseInt(agerange) <= 6) {

			ageRange = dao.adultRec();
			json = gson.toJson(ageRange);

		} else {

			ageRange = dao.seniorRec();
			json = gson.toJson(ageRange);
		}
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);

		/*
		 * for(int i=0; i<puppyRec.size(); i++) { System.out.println(puppyRec.get(i));
		 * JsonObject json = new JsonObject(); json.addProperty("title", puppyRec[0]);
		 * json.addProperty("site", puppyRec[1]); json.addProperty("price",
		 * puppyRec[2]); json.addProperty("img", puppyRec[3]); }
		 */

	}

}
