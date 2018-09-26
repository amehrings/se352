package edu.depaul.cdm.se.campusconnect;

import edu.depaul.cdm.se.campusconnect.ICourse;

public class Course implements ICourse{

	private long id;
	
	public Long getCourseID() {
		return id;
	}
	
	public void setCourseID(long id) {
		this.id = id;
	}
}
