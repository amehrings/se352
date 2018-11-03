package edu.depaul.cdm.se.users;

import java.util.Date;
import java.util.List;

public interface UserDAL {
   User saveUser(User user);
   List<User> getAllUsers();
   List<User> getAllUsersPaginated(
      int pageNumber, int pageSize);
   User findOneByName(String name);
   List<User> findByName(String name);
   List<User> findByBirthDateAfter(Date date);
   List<User> findByAgeRange(int lowerBound, int upperBound);
   List<User> findByCourse(String course);
   void updateMultipleUserAge();
   User updateOneUser(User user);
   void deleteUser(User user);
}
