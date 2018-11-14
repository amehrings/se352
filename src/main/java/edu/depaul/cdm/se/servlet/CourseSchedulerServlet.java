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

@WebServlet("/courseScheduler")
public class CourseSchedulerServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		List<Course> courses = courseDAO.readAllCourse();
		List<Course> courseCartCourses = courseDAO.readAllCourseCart();
		List<Course> enrolledCourses = courseDAO.readAllEnrolledCourse();
		List<String> toDoItems = courseDAO.readAllToDoItems();
		List<String> finishedItems = courseDAO.readAllFinishedItems();
		request.setAttribute("courses", courses);
		request.setAttribute("courseCartCourses", courseCartCourses);
		request.setAttribute("enrolledCourses", enrolledCourses);
		request.setAttribute("toDoItems", toDoItems);
		request.setAttribute("finishedItems", finishedItems);
		
		boolean isStudent;
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("/courseScheduler.jsp");
		if (request.getParameter("isStudent") != null) {
			isStudent = (request.getParameter("isStudent").equals("yes")) ? true : false;
			if(!isStudent)
		 		rd = request.getRequestDispatcher("/courses.jsp");
		}
		rd.forward(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//String id = request.getParameter("id");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		if ((name == null || name.equals(""))
				|| (location == null || location.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
			rd.forward(request, response);
		} else {
			Course c = new Course();
			c.setLocation(location);
			c.setName(name);
			//c.setId(id);
			MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
			MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
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

