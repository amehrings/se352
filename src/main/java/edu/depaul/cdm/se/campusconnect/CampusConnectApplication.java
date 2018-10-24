package edu.depaul.cdm.se.campusconnect;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;

import edu.depaul.cdm.se.campusconnect.ICourse;
import edu.depaul.cdm.se.campusconnect.Course;
import java.util.List;

@SpringBootApplication(exclude = {MongoAutoConfiguration.class, MongoDataAutoConfiguration.class})
public class CampusConnectApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(CampusConnectApplication.class, args);
		
		CampusConnectApplication campusConnectApplication = new CampusConnectApplication();
		
		campusConnectApplication.createExample();
//		campusConnectApplication.showEntities();
//	    campusConnectApplication.deleteExample();
//	    campusConnectApplication.showEntities();
	}
	
	private void createExample() {
        CourseService services = new CourseService();
        Course course = new Course();
        Course course2 = new Course();
        course.setId("CSC394");
        System.out.println("Setting course id to CSC394");
//        System.out.println("Setting course2 id to 1111111111");

        course2.setId("SE352");
        services.saveCourse(course2);
        services.saveCourse(course);
    }
    
//    private void deleteExample() {
//        CourseService services = new CourseService();
////        if (services.deleteCourse("SE352") > 0)
////            System.out.println("1234567890 has been deleted!");
//    }

//    private void showEntities() {
//        CourseService services = new CourseService();
//        List<ICourse> courses = services.getAllCourses();
//        System.out.println(courses);
//    }
}
