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
		String id = request.getParameter("id"); // keep it non-editable in UI
		if (id == null || "".equals(id)) {
			throw new ServletException("id missing for edit operation");
		}
 		String todo = request.getParameter("itemToAdd");
		
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		
		if (todo == null || todo.equals("")) {
			request.setAttribute("error", "Fields can't be empty");	
			request.setAttribute("todo", todo);

		} else {
			courseDAO.updateToDo(todo);
			LOG.info("item edited successfully with id=" + id);
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