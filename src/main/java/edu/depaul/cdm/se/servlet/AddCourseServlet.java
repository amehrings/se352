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
import com.mongodb.MongoClientURI;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		String name = request.getParameter("name");
//		String location = request.getParameter("location");
//		if ((name == null || name.equals(""))
//				|| (location == null || location.equals(""))) {
//			request.setAttribute("error", "Mandatory Parameters Missing");
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(
//					"/courses.jsp");
//			rd.forward(request, response);
//		} else {
//			Course c = new Course();
//			c.setLocation(location);
//			c.setName(name);
//			MongoClient mongo = (MongoClient) request.getServletContext()
//					.getAttribute("MONGO_CLIENT");
//			MongoClientURI uri = (MongoClientURI) request.getServletContext()
//					.getAttribute("MONGO_URI");
//			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo, uri);
//			courseDAO.createCourse(c);
//			System.out.println("Course Added Successfully with id="+c.getId());
//			request.setAttribute("success", "Course Added Successfully");
//			List<Course> courses = courseDAO.readAllCourse();
//			request.setAttribute("courses", courses);
//
//			RequestDispatcher rd = getServletContext().getRequestDispatcher(
//					"/courses.jsp");
//			rd.forward(request, response);
//		}
	}

}

