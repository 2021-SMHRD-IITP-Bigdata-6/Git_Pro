

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

import com.dogpro.memberDAO.dogDAO;


@WebServlet("/GetDogInfo")
public class GetDogInfo extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String dogKind = request.getParameter("kind");
		System.out.println(dogKind);
		
		dogDAO dao  = new dogDAO();
		String[] dogData = dao.getDogInfo(dogKind);
		
		System.out.println(Arrays.toString(dogData));
		
		//데이터 베이스에있는 
		
		
	}

}
