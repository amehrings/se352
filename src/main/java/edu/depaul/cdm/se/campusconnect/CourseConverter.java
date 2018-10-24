package edu.depaul.cdm.se.campusconnect;

import org.bson.types.ObjectId;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

public class CourseConverter {

	// convert Person Object to MongoDB DBObject
	// take special note of converting id String to ObjectId
	public static DBObject toDBObject(Course c) {

		BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
				.append("name", c.getName()).append("location", c.getLocation());
		if (c.getId() != null)
			builder = builder.append("_id", new ObjectId(c.getId()));
		return builder.get();
	}

	// convert DBObject Object to Person
	// take special note of converting ObjectId to String
	public static Course toCourse(DBObject doc) {
		Course c = new Course();
		c.setName((String) doc.get("name"));
		c.setLocation((String) doc.get("location"));
		ObjectId id = (ObjectId) doc.get("_id");
		c.setId(id.toString());
		return c;

	}
	
}

