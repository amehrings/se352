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

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);

		List<Course> courses = courseDAO.readAllCourse();
		request.setAttribute("courses", courses);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/search.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		String professor = request.getParameter("professor");
		String times = request.getParameter("times");
		if ((name == null || name.equals(""))
				|| (location == null || location.equals(""))
				|| (description == null || description.equals(""))
				|| (professor == null || professor.equals(""))
				|| (times == null || times.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/search.jsp");
			rd.forward(request, response);
		} else {
			Course c = new Course();
			c.setLocation(location);
			c.setName(name);
			c.setDescription(description);
			c.setTimes(times);
			c.setProfessor(professor);
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
			courseDAO.createCourse(c);
			System.out.println("Course Added Successfully with id="+c.getId());
			request.setAttribute("success", "Course Added Successfully");
			List<Course> courses = courseDAO.readAllCourse();
			request.setAttribute("courses", courses);

			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/search.jsp");
			rd.forward(request, response);
		}
	}

}

