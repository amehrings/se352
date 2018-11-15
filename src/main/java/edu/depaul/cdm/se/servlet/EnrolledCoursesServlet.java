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
 @WebServlet("/enrolledCourses")
public class EnrolledCoursesServlet extends HttpServlet {
 	private static final long serialVersionUID = -6554920927964049383L;
 	
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
			Course c = new Course();
			c.setId(id);
			c.setLocation(location);
			c.setName(name);
			c.setProfessor(professor);
			c.setTimes(times);
			c.setDescription(description);
			
			List<Course> enrolledCourses = courseDAO.readAllEnrolledCourse();
			for(Course course: enrolledCourses) {
				if(c.getId().equals(course.getId())) {
					courseDAO.deleteEnrolledCourse(course);
				}
			}
			
			List<Course> droppedCourses = courseDAO.readAllDroppedCourse();
			for(Course course: droppedCourses) {
				if(c.getId().equals(course.getId())) {
					courseDAO.removeFromDropped(course);
				}
			}
			
			courseDAO.enrollCourse(c);
			courseDAO.removeCourseCartCourse(c);
		}

		List<Course> enrolledCourses = courseDAO.readAllEnrolledCourse();
		request.setAttribute("enrolledCourses", enrolledCourses);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/enrolledCourses.jsp");
		rd.forward(request, response);
	}
 }