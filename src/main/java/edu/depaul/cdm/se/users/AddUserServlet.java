package edu.depaul.cdm.se.users;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.MongoClient;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;
//	private final UserDAL userDAL;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String courses = request.getParameter("courses");
		List<String> cs = new ArrayList<String>();
		cs.add(courses);
		String dob = request.getParameter("dateOfBirth");
//		if ((name == null || name.equals(""))
//				|| (courses == null || courses.equals(""))
//				|| (dob == null || dob.equals(""))) {
//			request.setAttribute("error", "Mandatory Parameters Missing");
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(
//					"/courses.jsp");
//			rd.forward(request, response);
//		} else {
//			
//			User p = new User(name, cs, new Date(695845800000L));
//			
//			personDAO.createPerson(p);
//			System.out.println("Person Added Successfully with id="+p.getId());
//			request.setAttribute("success", "Person Added Successfully");
//			List<Person> persons = personDAO.readAllPerson();
//			request.setAttribute("persons", persons);
//
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(
//					"/persons.jsp");
//			rd.forward(request, response);
//		}
	}
	
	
	
}
