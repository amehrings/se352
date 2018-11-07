package edu.depaul.cdm.se.courses;

public interface ICourse {

	String getId();
	void setId(String id);
	
	String getName();
	void setName(String name);
	
	String getLocation();
	void setLocation(String location);
	
	String getDescription();
	void setDescription(String desc);
	
	String getProfessor();
	void setProfessor(String prof);
	
	String getTimes();
	void setTimes(String times);
}
