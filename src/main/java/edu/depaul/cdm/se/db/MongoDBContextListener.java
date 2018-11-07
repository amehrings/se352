package edu.depaul.cdm.se.db;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;


@WebListener
public class MongoDBContextListener implements ServletContextListener {

	private static final String USER_NAME ="ccUser";
	private static final String PASSWORD ="ccp123";
	private static final String MONGO_URL ="mongodb://"+ USER_NAME + ":"+ PASSWORD +"@ds115263.mlab.com:15263/campusconnectsandbox";
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		MongoClient mongo = (MongoClient) sce.getServletContext()
							.getAttribute("MONGO_CLIENT");
		mongo.close();
		System.out.println("MongoClient closed successfully");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			MongoClient mongo = new MongoClient(new MongoClientURI(MONGO_URL));
			System.out.println("MongoClient initialized successfully");
			sce.getServletContext().setAttribute("MONGO_CLIENT", mongo);
		} catch (Exception e) {
			throw new RuntimeException("MongoClient init failed");
		}
	}

}

