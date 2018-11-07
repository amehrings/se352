package edu.depaul.cdm.se.users;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.List;


@Document(collection = "user")
public class User implements IUser {
   
	@Id
	private String userId;
	private String name;
	private List<String> currentlyEnrolledCourses;
	private List<String> enrolledCourses;
	private List<String> courseCart;
	private boolean readyToEnroll;
   
	public User() {}

	public User(String userId) {}
   
   
	@Override
	public String toString() {
		return String.format("User{userId='%s', name='%s'}\n",
               userId, name);
	}

	@Override
	public String getId() {
		return userId;
	}
	
	@Override
	public void setId(String id) {
		this.userId = id;
	}
	
	@Override
	public String getName() {
		return name;
	}
	
	@Override
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public List<String> getCurrentlyEnrolledCourses() {
		return currentlyEnrolledCourses;
	}
	
	@Override
	public void setCurrentlyEnrolledCourses(List<String> currentlyEnrolled) {
		this.currentlyEnrolledCourses = currentlyEnrolled;
	}
	
	@Override
	public List<String> getEnrolledCourses() {
		return enrolledCourses;
	}
	
	@Override
	public void setEnrolledCourses(List<String> enrolledCourses) {
		this.enrolledCourses = enrolledCourses;
	}
	
	@Override
	public List<String> getCourseCart() {
		return courseCart;
	}
	
	@Override
	public void setCourseCart(List<String> courseCart) {
		this.courseCart = courseCart;
	}
	
	@Override
	public boolean getReadyToEnroll() {
		return readyToEnroll;
	}
	
	@Override
	public void setReadyToEnroll(boolean ready) {
		this.readyToEnroll = ready;
	}
}