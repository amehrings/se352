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

@WebServlet("/deleteToDo")
public class DeleteToDoServlet extends HttpServlet {
 	
	private static final long serialVersionUID = 6798036766148281767L;
	
 	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
 		String toDo = request.getParameter("toDoDel");		
		if (toDo == null || "".equals(toDo)) {
			throw new ServletException("new To Do missing for edit operation");
		}
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		
		courseDAO.deleteToDo(toDo);
		System.out.println("Course deleted successfully with text: " + toDo);
		request.setAttribute("todoSuccess", "To Do deleted successfully");
		
		List<Course> courses;
		List<String> todos;
		courses = courseDAO.readAllCourse();
		todos = courseDAO.readAllToDoItems();
		request.setAttribute("toDoItems", todos);
		request.setAttribute("courses", courses);
		
 		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/courses.jsp");
		rd.forward(request, response);
	}
 }