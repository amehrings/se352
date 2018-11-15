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

@WebServlet("/addToDo")
public class AddToDoServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;
	private static final Logger LOG = LoggerFactory.getLogger("CampusConnect");
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todo = request.getParameter("itemToAdd");
		
		RequestDispatcher rd;
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		List<Course> courses;
		List<String> todos;
		courses = courseDAO.readAllCourse();
		todos = courseDAO.readAllToDoItems();
		
		//if adding to do item
		if (todo == null || todo.equals("")) {
			request.setAttribute("todoError", "Field can't be empty.");
		}
		else {
			courseDAO.createToDo(todo);
			LOG.info("toDo added!");
			request.setAttribute("todoSuccess", "Task Added Successfully");
		}
		
		rd = getServletContext().getRequestDispatcher("/courses.jsp");
		request.setAttribute("courses", courses);
		request.setAttribute("toDoItems", todos);
		rd.forward(request, response);
		
	}
}

