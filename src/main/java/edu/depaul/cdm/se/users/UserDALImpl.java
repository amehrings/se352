package edu.depaul.cdm.se.users;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

@Repository
public class UserDALImpl implements UserDAL {

    private final MongoTemplate mongoTemplate;

    @Autowired
    public UserDALImpl(MongoTemplate mongoTemplate) {
        this.mongoTemplate = mongoTemplate;
    }

    @Override
    public User saveUser(User user) {
       mongoTemplate.save(user);
       return user;
    }

    @Override
    public List<User> getAllUsers() {
       return mongoTemplate.findAll(User.class);
    }

    @Override
    public List<User> getAllUsersPaginated(int pageNumber, int pageSize) {
       Query query = new Query();
       query.skip(pageNumber * pageSize);
       query.limit(pageSize);
       return mongoTemplate.find(query, User.class);
    }

    @Override
    public User findOneByName(String name) {
       Query query = new Query();
       query.addCriteria(Criteria.where("name").is(name));
       return mongoTemplate.findOne(query, User.class);
    }

    @Override
    public List<User> findByName(String name) {
       Query query = new Query();
       query.addCriteria(Criteria.where("name").is(name));
       return mongoTemplate.find(query, User.class);
    }

    @Override
    public List<User> findByBirthDateAfter(Date date) {
       Query query = new Query();
       query.addCriteria(Criteria.where("dateOfBirth").gt(date));
       return mongoTemplate.find(query, User.class);
    }
    @Override
    public List<User> findByAgeRange(int lowerBound, int upperBound) {
       Query query = new Query();
       query.addCriteria(Criteria.where("age").gt(lowerBound)
               .andOperator(Criteria.where("age").lt(upperBound)));
       return mongoTemplate.find(query, User.class);
    }
    @Override
    public List<User> findByCourse(String course) {
       Query query = new Query();
       query.addCriteria(Criteria.where("favoriteBooks").in(course));
       return mongoTemplate.find(query, User.class);
    }

    @Override
    public void updateMultipleUserAge() {
       Query query = new Query();
       Update update = new Update().inc("age", 1);
       mongoTemplate.findAndModify(query, update, User.class);;
    }
    @Override
    public User updateOneUser(User user) {
       mongoTemplate.save(user);
       return user;
    }

    @Override
    public void deleteUser(User user) {
       mongoTemplate.remove(user);
    }

}
