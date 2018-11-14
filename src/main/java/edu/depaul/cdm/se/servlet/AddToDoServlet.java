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

@WebServlet("/addCourse")
public class AddToDoServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;
	private static final Logger LOG = LoggerFactory.getLogger("CampusConnect");
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//String id = request.getParameter("id");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String description = request.getParameter("description");
		String professor = request.getParameter("professor");
		String times = request.getParameter("times");
		
		RequestDispatcher rd;
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);
		List<Course> courses;
		
		//if adding do item
		if (request.getAttribute("itemToAdd") != null || !request.getAttribute("itemToAdd").equals("")) {
			courseDAO.createToDo(request.getParameter("itemToAdd"));
			LOG.info("toDo added!");
			
			request.setAttribute("success", "todo Added Successfully");
			courses = courseDAO.readAllCourse();
			List<String> toDoItems = courseDAO.readAllToDoItems();
			request.setAttribute("courses", courses);
			request.setAttribute("toDoItems", toDoItems);
			
			rd = getServletContext().getRequestDispatcher("/courses.jsp");
			rd.forward(request, response);
		}
		//if adding course, but missing parameter	
		else if ((name == null || name.equals(""))
				|| (location == null || location.equals(""))
				|| (description == null || description.equals(""))
				|| (professor == null || professor.equals(""))
				|| (times == null || times.equals(""))) {
			request.setAttribute("error", "Mandatory Parameters Missing");
			rd = getServletContext().getRequestDispatcher(
					"/courses.jsp");
			rd.forward(request, response);
		} 
		
		//adding course
		else {
			Course c = new Course();
			c.setLocation(location);
			c.setName(name);
			c.setDescription(description);
			c.setTimes(times);
			c.setProfessor(professor);
			
			courseDAO.createCourse(c);
			LOG.info("Course Added Successfully with id="+c.getId());
			request.setAttribute("success", "Course Added Successfully");
			courses = courseDAO.readAllCourse();
			request.setAttribute("courses", courses);

			rd = getServletContext().getRequestDispatcher(
					"/courses.jsp");
			rd.forward(request, response);
		}
	}
}

