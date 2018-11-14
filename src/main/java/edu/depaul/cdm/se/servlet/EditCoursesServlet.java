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

@WebServlet("/editCourse")
public class EditCoursesServlet extends HttpServlet {
 	
	private static final long serialVersionUID = -6554920927964049383L;
 	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for edit operation");
		}
		
		System.out.println("Course edit requested with id=" + id);
		
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		
		Course c = new Course();
		c.setId(id);
		c = courseDAO.readCourse(c);
		request.setAttribute("course", c);
		List<Course> courses = courseDAO.readAllCourse();
		request.setAttribute("courses", courses);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
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
		String description = request.getParameter("description");
		String professor = request.getParameter("professor");
		String times = request.getParameter("times");
 		if ((name == null || name.equals(""))
				|| (location == null || location.equals(""))
				|| (description == null || description.equals(""))
				|| (professor == null || professor.equals(""))
				|| (times == null || times.equals(""))) {
			request.setAttribute("error", "Fields can't be empty");
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
			Course c = new Course();
			c.setId(id);
			c.setName(name);
			c.setLocation(location);
			c.setDescription(description);
			c.setTimes(times);
			c.setProfessor(professor);
			request.setAttribute("course", c);
			List<Course> courses = courseDAO.readAllCourse();
			request.setAttribute("courses", courses);
 			RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
			rd.forward(request, response);
		} else {
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
			Course c = new Course();
			c.setId(id);
			c.setName(name);
			c.setLocation(location);
			c.setDescription(description);
			c.setTimes(times);
			c.setProfessor(professor);
			courseDAO.updateCourse(c);
			System.out.println("Course edited successfully with id=" + id);
			request.setAttribute("success", "Course edited successfully");
			List<Course> courses = courseDAO.readAllCourse();
			request.setAttribute("courses", courses);
 			RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
			rd.forward(request, response);
		}
	}
 }