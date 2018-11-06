package edu.depaul.cdm.se.campusconnect;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

 //DAO class for different MongoDB CRUD operations
//take special note of "id" String to ObjectId conversion and vice versa
//also take note of "_id" key for primary key
public class MongoDBCourseDAO {
 	
	private DBCollection col;
	private DBCollection enrolledCol;
	private DBCollection droppedCol;

 	
	@SuppressWarnings("deprecation")
	public MongoDBCourseDAO(MongoClient mongo) {
		this.col = mongo.getDB("campusconnectsandbox").getCollection("courses");
		this.enrolledCol = mongo.getDB("campusconnectsandbox").getCollection("enrollCourses");
		this.droppedCol = mongo.getDB("campusconnectsandbox").getCollection("dropCourses");

	}
 	
	public Course createCourse(Course c) {
		DBObject doc = CourseConverter.toDBObject(c);
		this.col.insert(doc);
		ObjectId id = (ObjectId) doc.get("_id");
		c.setId(id.toString());
		return c;
	}
	
	public Course createEnrolledCourse(Course c) {
		DBObject doc = CourseConverter.toDBObject(c);
		this.enrolledCol.insert(doc);
		ObjectId id = (ObjectId) doc.get("_id");
		c.setId(id.toString());
		return c;
	}
	
 	public void updateCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		this.col.update(query, CourseConverter.toDBObject(c));
	}
 	
 	
 	
 	public List<Course> readAllEnrolledCourse() {
		List<Course> data = new ArrayList<Course>();
		DBCursor cursor = enrolledCol.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Course c = CourseConverter.toCourse(doc);
			data.add(c);
		}
		return data;
	}
 	
 	public List<Course> readAllDroppedCourse() {
		List<Course> data = new ArrayList<Course>();
		DBCursor cursor = droppedCol.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Course c = CourseConverter.toCourse(doc);
			data.add(c);
		}
		return data;
	}
 	
 	public List<Course> readAllCourse() {
		List<Course> data = new ArrayList<Course>();
		DBCursor cursor = col.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			Course c = CourseConverter.toCourse(doc);
			data.add(c);
		}
		return data;
	}
 	
 	public void deleteCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		this.col.remove(query);
	}
 	
 	public void deleteEnrolledCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		this.enrolledCol.remove(query);
	}
 	
 	public void deletePreEnrolledCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		this.col.remove(query);
	}
 	
 	public void enrollCourse(Course c) {
 		DBObject doc = CourseConverter.toDBObject(c);
		this.enrolledCol.insert(doc);
 	}
 	
 	public void dropCourse(Course c) {
 		DBObject doc = CourseConverter.toDBObject(c);
		this.droppedCol.insert(doc);
//		ObjectId id = (ObjectId) doc.get("_id");
//		c.setId(id.toString());
//		c.setName(name);
	}
 	
 	public Course readCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		DBObject data = this.col.findOne(query);
		return CourseConverter.toCourse(data);
	}
 }
