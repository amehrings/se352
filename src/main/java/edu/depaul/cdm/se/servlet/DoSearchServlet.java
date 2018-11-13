package edu.depaul.cdm.se.servlet;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/doSearch")
public class DoSearchServlet extends HttpServlet {

	private static final long serialVersionUID = -7060758261496829905L;
	private static final Logger LOG = LoggerFactory.getLogger("CampusConnect");

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		MongoClient mongo = (MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT");
		MongoDBCourseDAO courseDAO = new MongoDBCourseDAO(mongo);

		List<Course> temp_courses = courseDAO.readAllCourse();
		List<Course> courses = new ArrayList<Course>();
		LOG.info("doing get in doSearch");
		LOG.info("search is: " + request.getParameter("search"));
		for (Course c: temp_courses) {
			LOG.info("c is: " + c.getName());
			if (c.getName() != null) {
				if (c.getName().toLowerCase().contains(request.getParameter("search").toLowerCase())) {
					LOG.info("name matches search");
					courses.add(c);
				}
			}
		}
		request.setAttribute("courses", courses);
 		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/search.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		LOG.info("doing POST in doSearch");
	}

}

