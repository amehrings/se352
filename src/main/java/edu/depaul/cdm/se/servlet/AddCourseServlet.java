package edu.depaul.cdm.se.servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import edu.depaul.cdm.se.campusconnect.MongoDBCourseDAO;
import edu.depaul.cdm.se.campusconnect.Course;

import com.mongodb.MongoClient;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
	
 	private static final long serialVersionUID = -7060758261496829905L;
 	private final Logger LOG = LoggerFactory.getLogger(getClass());
 	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		LOG.info("Doing the POST");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		LOG.info("Name: " + name + ", Location: " + location);
		if ((name == null || name.equals("")) || (location == null || location.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
			rd.forward(request, response);
		} else {
			Course c = new Course();
			c.setLocation(location);
			c.setName(name);
			LOG.info("We set the courses");
			MongoClient mongo = (MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
			LOG.info("MongoClient set?");
			courseDAO.createCourse(c);
			System.out.println("Course Added Successfully with id="+c.getId());
			request.setAttribute("success", "Course Added Successfully");
			List<Course> courses = courseDAO.readAllCourse();
			request.setAttribute("courses", courses);
 			RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
			rd.forward(request, response);
		}
	}
 }