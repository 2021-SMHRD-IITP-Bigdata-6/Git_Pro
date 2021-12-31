

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

import com.dogpro.memberDAO.dogDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/GetDogInfo")
public class GetDogInfo extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dogKind = request.getParameter("kind");
		System.out.println(dogKind);
		
		dogDAO dao  = new dogDAO();
		String[] dogData = dao.getDogInfo(dogKind);
		
		for(int i=0; i<dogData.length; i++) {
			System.out.println(dogData[i]);
		}
		
		
		//Gson gson = new Gson();
		JsonObject json = new JsonObject();
		json.addProperty("avg", dogData[0]);
		json.addProperty("Max", dogData[1]);
		
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		//System.out.println(Arrays.toString(dogData));
		
		//데이터 베이스에있는 
		
//		시도 1
//		request.setAttribute("dogData", dogData);
//		ServletContext context = getServletContext();
//		
//		RequestDispatcher dispatcher = context.getRequestDispatcher("/Mypage_Firstjsp.jsp");
//		dispatcher.forward(request, response);
//		
		
//		시도 2
//		PrintWriter out = response.getWriter();
		
		
		
		
	}

}
