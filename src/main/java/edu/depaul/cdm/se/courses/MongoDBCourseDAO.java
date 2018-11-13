package edu.depaul.cdm.se.courses;

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
	private DBCollection courseCartCol;
	private DBCollection enrolledCol;
	private DBCollection droppedCol;
	private DBCollection toDoItemsCol;
	private DBCollection finishedItemsCol;
 	
	@SuppressWarnings("deprecation")
	public MongoDBCourseDAO(MongoClient mongo) {
		this.col = mongo.getDB("campusconnectsandbox").getCollection("courses");
		this.courseCartCol = mongo.getDB("campusconnectsandbox").getCollection("courseCart");
		this.enrolledCol = mongo.getDB("campusconnectsandbox").getCollection("enrollCourses");
		this.droppedCol = mongo.getDB("campusconnectsandbox").getCollection("dropCourses");
		this.toDoItemsCol = mongo.getDB("campusconnectsandbox").getCollection("toDoItems");
		this.finishedItemsCol = mongo.getDB("campusconnectsandbox").getCollection("finishedItems");
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
 	
 	public List<Course> readAllCourseCart() {
		List<Course> data = new ArrayList<Course>();
		DBCursor cursor = courseCartCol.find();
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
 	
 	public List<String> readAllToDoItems() {
		List<String> data = new ArrayList<String>();
		DBCursor cursor = toDoItemsCol.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			data.add(toItem(doc));
		}
		return data;
	}
 	
 	public List<String> readAllFinishedItems() {
		List<String> data = new ArrayList<String>();
		DBCursor cursor = finishedItemsCol.find();
		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			data.add(toItem(doc));
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
 	
 	public void removeCourseCartCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		this.courseCartCol.remove(query);
	}
 	
 	public void enrollCourse(Course c) {
 		DBObject doc = CourseConverter.toDBObject(c);
		this.enrolledCol.insert(doc);
 	}
 	
 	public void addCourseCartCourse(Course c) {
 		DBObject doc = CourseConverter.toDBObject(c);
		this.courseCartCol.insert(doc);
 	}
 	
 	public void dropCourse(Course c) {
 		DBObject doc = CourseConverter.toDBObject(c);
		this.droppedCol.insert(doc);
	}
 	
 	public void swapCourseFromCourseCart(Course c1, Course c2) {
 		DBObject doc = CourseConverter.toDBObject(c2);
		this.enrolledCol.insert(doc);
		
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c1.getId())).get();
		this.enrolledCol.remove(query);
		
 	}
 	
 	public Course readCourse(Course c) {
		DBObject query = BasicDBObjectBuilder.start()
				.append("_id", new ObjectId(c.getId())).get();
		DBObject data = this.col.findOne(query);
		return CourseConverter.toCourse(data);
	}
 	
 	
 	public void checkItem(String item) {
 		DBObject query = BasicDBObjectBuilder.start()
				.append("item", item).get();
 		
		this.finishedItemsCol.insert(toDBObject(item));
		
		
		this.toDoItemsCol.remove(query);
	}
 	
 	public static DBObject toDBObject(String item) {
		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
				.append("item", item);
				
//		if (item != null)
//			builder = builder.append("_id", new ObjectId(item));
		return builder.get();
	}
 	
 	public static String toItem(DBObject doc) {
		return ((String) doc.get("item"));
	}

 }
