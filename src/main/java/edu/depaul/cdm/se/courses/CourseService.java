package edu.depaul.cdm.se.courses;

import org.bson.Document;

import com.mongodb.Block;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;

import java.util.List;
import java.util.ArrayList;

public class CourseService {
	private MongoClient mongoClient;
	private MongoCollection<Document> db;

	private static final String courseID = "1234567890";
	private static final String USER_NAME ="ccUser";
	private static final String PASSWORD ="ccp123";
	private static final String MONGO_URL ="mongodb://"+ USER_NAME + ":"+ PASSWORD +"@ds115263.mlab.com:15263/campusconnectsandbox";
	private static final String COLLECTION_NAME = "courses";
	
	public CourseService() {
		MongoClientURI uri = new MongoClientURI(MONGO_URL);
		mongoClient = new MongoClient(uri);
		db = mongoClient.getDatabase(uri.getDatabase()).getCollection(COLLECTION_NAME);
	}
	
	public long deleteCourse(int courseid) {
		return db.deleteMany(new Document().append(courseID, courseid)).getDeletedCount();
	}
	
	public List<ICourse> getAllCourses(){
		List<ICourse> courses = new ArrayList<>(); 
        FindIterable<Document> it = db.find();
        it.forEach(new Block<Document>() {
            @Override
            public void apply(Document d) {
                Course course = new Course();
                course.setId(d.get(courseID, String.class));
                courses.add(course);
            }

        });
        return courses;
	}
	
	public void saveCourse(ICourse course) {
	       db.insertOne(new Document().
	                append(courseID, course.getId()));
	}
	
	public MongoCollection<Document> getDB() {
		return db;
	}
	
	
}
