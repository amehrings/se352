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

import edu.depaul.cdm.se.courses.Course;
import edu.depaul.cdm.se.courses.MongoDBCourseDAO;

import com.mongodb.MongoClient;

@WebServlet("/editToDo")
public class EditToDoServlet extends HttpServlet {
 	
	private static final long serialVersionUID = -6554920927964049383L;
	private static final Logger LOG = LoggerFactory.getLogger("CampusConnect");
 	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String newToDo = request.getParameter("newToDo");
		
		if (newToDo == null || "".equals(newToDo)) {
			throw new ServletException("new To Do missing for edit operation");
		}
		
		LOG.info("To Do edit GET requested for: " + newToDo);
		
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		
		request.setAttribute("newToDo", newToDo);

		List<Course> courses;
		List<String> todos;
		courses = courseDAO.readAllCourse();
		todos = courseDAO.readAllToDoItems();
		request.setAttribute("toDoItems", todos);
		request.setAttribute("courses", courses);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
		rd.forward(request, response);
	}
	
 	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String newToDo = request.getParameter("newToDo");		
		if (newToDo == null || "".equals(newToDo)) {
			throw new ServletException("new To Do missing for edit operation");
		}
		
		LOG.info("To Do edit GET requested for: " + newToDo);
		
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		
		if (newToDo == null || "".equals(newToDo)) {
			request.setAttribute("error", "Fields can't be empty");	
			request.setAttribute("todo", newToDo);

		} else {
			courseDAO.updateToDo(newToDo);
			LOG.info("to do edited successfully with item: " + newToDo);
			request.setAttribute("success", "todo edited successfully");
		}
 		
 		List<Course> courses = courseDAO.readAllCourse();
 		List<String> todos = courseDAO.readAllToDoItems();
		request.setAttribute("courses", courses);
		request.setAttribute("toDoItems", todos);
 		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/courses.jsp");
		rd.forward(request, response);
	}
 }