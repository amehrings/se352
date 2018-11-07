package edu.depaul.cdm.se.users;

import java.util.List;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DBObject;

import edu.depaul.cdm.se.users.User;

public class UserConverter {
	// convert Course Object to MongoDB DBObject
		// take special note of converting id String to ObjectId
		public static DBObject toDBObject(User u) {
			BasicDBObjectBuilder builder = BasicDBObjectBuilder.start()
					.append("name", u.getName()).append("currentlyEnrolled", u.getCurrentlyEnrolledCourses())
					.append("enrolledCourses", u.getEnrolledCourses()).append("courseCart", u.getCourseCart());
			if (u.getId() != null)
				builder = builder.append("_id", new ObjectId(u.getId()));
			return builder.get();
		}

		// convert DBObject Object to Course
		// take special note of converting ObjectId to String
		@SuppressWarnings("unchecked")
		public static User toCourse(DBObject doc) {
			User u = new User();
			u.setName((String) doc.get("name"));
			u.setCurrentlyEnrolledCourses((List<String>) doc.get("currentlyEnrolled"));
			u.setEnrolledCourses((List<String>) doc.get("enrolledCourses"));
			u.setCourseCart((List<String>) doc.get("courseCart"));
			ObjectId id = (ObjectId) doc.get("_id");
			u.setId(id.toString());
			return u;

		}
}
