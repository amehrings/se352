package edu.depaul.cdm.se.users;

import java.util.List;

public interface IUser {
	
	String getId();
	void setId(String id);
	
	String getName();
	void setName(String name);
	
	List<String> getCurrentlyEnrolledCourses();
	void setCurrentlyEnrolledCourses(List<String> currentlyEnrolled);
	
	List<String> getEnrolledCourses();
	void setEnrolledCourses(List<String> enrolledCourses);
	
	List<String> getCourseCart();
	void setCourseCart(List<String> courseCart);
	
	boolean getReadyToEnroll();
	void setReadyToEnroll(boolean ready);

}
