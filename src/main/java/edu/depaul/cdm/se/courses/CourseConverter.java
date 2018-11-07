package edu.depaul.cdm.se.courses;

import org.bson.types.ObjectId;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

public class CourseConverter {

	// convert Course Object to MongoDB DBObject
	// take special note of converting id String to ObjectId
	public static DBObject toDBObject(Course c) {
		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
				.append("name", c.getName()).append("location", c.getLocation())
				.append("description", c.getDescription()).append("professor", c.getProfessor())
				.append("times", c.getTimes());
		if (c.getId() != null)
			builder = builder.append("_id", new ObjectId(c.getId()));
		return builder.get();
	}

	// convert DBObject Object to Course
	// take special note of converting ObjectId to String
	public static Course toCourse(DBObject doc) {
		Course c = new Course();
		c.setName((String) doc.get("name"));
		c.setLocation((String) doc.get("location"));
		c.setDescription((String) doc.get("description"));
		c.setProfessor((String) doc.get("professor"));
		c.setTimes((String) doc.get("times"));
		ObjectId id = (ObjectId) doc.get("_id");
		c.setId(id.toString());
		return c;

	}
	
}

