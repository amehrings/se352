package edu.depaul.cdm.se.courses;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "courses")
public class Course implements ICourse{

	private String id;
	private String name;
	private String location;
	private String description;
	private String professor;
	private String times;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String getDescription() {
		return description;
	}

	@Override
	public void setDescription(String desc) {
		this.description = desc;
	}

	@Override
	public String getProfessor() {
		return professor;
	}

	@Override
	public void setProfessor(String prof) {
		this.professor = prof;
	}

	
	public String getTimes() {
		return times;
	}

	@Override
	public void setTimes(String times) {
		this.times = times;
		
	}
}

