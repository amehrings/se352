package edu.depaul.cdm.se.users;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/")
public class UserController {

	private final Logger LOG = LoggerFactory.getLogger(getClass());
	
	//define Data Access Layer object
	private final UserDAL userDAL;

	//initialize DAL object via constructor autowiring
	public UserController(UserDAL userDAL) {
		this.userDAL = userDAL;
	}

	//change method implementation to use DAL and hence MongoTemplate
	@RequestMapping(value = "/courses/{userName}", method = RequestMethod.GET)
	public Object getUserInfo(@PathVariable String userName) {
		LOG.info("Getting user: " + userName);
	    User user = userDAL.findOneByName(userName);
	    if (user != null) {
	        return user.toString();
	    } else {
	        return "User not found.";
	    }
	}
//
//	//change method implementation to use DAL and hence MongoTemplate
//	@RequestMapping(value = "/settings/{userId}/{key}", method = RequestMethod.GET)
//	public String getUserSetting(
//	        @PathVariable String userId, @PathVariable String key) {
//	    return userDAL.getUserSetting(userId, key);
//	}
}
