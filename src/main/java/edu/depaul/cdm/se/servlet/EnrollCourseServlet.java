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

@WebServlet("/enrollCourse")
public class EnrollCourseServlet extends HttpServlet {
 	
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
			courseDAO.addCourseCartCourse(c);
		}
		
		List<Course> courseCart = courseDAO.readAllCourseCart();
		request.setAttribute("courseCart", courseCart);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/enroll.jsp");
		rd.forward(request, response);
	}
 	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id"); // keep it non-editable in UI
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for edit operation");
		}
 		String name = request.getParameter("name");
		String location = request.getParameter("location");
 		if ((name == null || name.equals(""))
				|| (location == null || location.equals(""))) {
			request.setAttribute("error", "Name and location can't be empty");
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
			Course c = new Course();
			c.setId(id);
			c.setName(name);
			c.setLocation(location);
			request.setAttribute("course", c);
			List<Course> courses = courseDAO.readAllCourse();
			request.setAttribute("enrollCourses", courses);
 			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/enroll.jsp");
			rd.forward(request, response);
		} else {
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
			Course c = new Course();
			c.setId(id);
			c.setName(name);
			c.setLocation(location);
			courseDAO.updateCourse(c);
			System.out.println("Course enrolled successfully with id=" + id);
			request.setAttribute("success", "Course enrolled successfully");
			List<Course> courses = courseDAO.readAllCourse();
			request.setAttribute("enrollCourses", courses);
 			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/enroll.jsp");
			rd.forward(request, response);
		}
	}
 }