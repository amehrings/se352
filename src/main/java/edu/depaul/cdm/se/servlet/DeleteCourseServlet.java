package edu.depaul.cdm.se.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.depaul.cdm.se.campusconnect.MongoDBCourseDAO;
import edu.depaul.cdm.se.campusconnect.Course;
import com.mongodb.MongoClient;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {

	private static final long serialVersionUID = 6798036766148281767L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for delete operation");
		}
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		Course c = new Course();
		c.setId(id);
		courseDAO.deleteCourse(c);
		System.out.println("Course deleted successfully with id=" + id);
		request.setAttribute("success", "Course deleted successfully");
		List<Course> courses = courseDAO.readAllCourse();
		request.setAttribute("courses", courses);

		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/courses.jsp");
		rd.forward(request, response);
	}

}

