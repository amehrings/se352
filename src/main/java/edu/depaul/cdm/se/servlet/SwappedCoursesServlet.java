package edu.depaul.cdm.se.servlet;
 import java.io.IOException;
import java.util.List;
 import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.depaul.cdm.se.courses.Course;
import edu.depaul.cdm.se.courses.MongoDBCourseDAO;

import com.mongodb.MongoClient;
 @WebServlet("/swappedCourses")
public class SwappedCoursesServlet extends HttpServlet {
 	private static final long serialVersionUID = -6554920927964049383L;
 	
 	static Course c1 = new Course();

 	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String professor = request.getParameter("professor");
		String times = request.getParameter("times");
		String description = request.getParameter("description");
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		if(id != null) {
			c1.setId(id);
			c1.setLocation(location);
			c1.setName(name);
			c1.setProfessor(professor);
			c1.setTimes(times);
			c1.setDescription(description);
		}
		List<Course> swappedCourses = courseDAO.readAllCourseCart();
		request.setAttribute("swappedCourses", swappedCourses);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/swappedCourses.jsp");
		rd.forward(request, response);
	}
 }