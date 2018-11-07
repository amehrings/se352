package edu.depaul.cdm.se.campusconnect;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.mongo.MongoDataAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;


@SpringBootApplication(exclude = {MongoAutoConfiguration.class, MongoDataAutoConfiguration.class})
public class CampusConnectApplication {
	
	private static final Logger LOG = LoggerFactory.getLogger("CampusConnect");
	
	public static void main(String[] args) {
		SpringApplication.run(CampusConnectApplication.class, args);
		LOG.info("Application started successfully");
	}
}
