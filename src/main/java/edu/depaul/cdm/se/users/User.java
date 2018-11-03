package edu.depaul.cdm.se.users;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import static java.util.Calendar.DATE;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.YEAR;

@Document(collection = "user")
public class User {
   @Id
   private String userId;
   private String name;
   private long age;
   private List<String> courses;
   private Date dateOfBirth;
   
   public User() {}
   
   public User(String name, List<String> c, Date dateOfBirth) {
       this.name = name;
       this.courses = c;
       this.dateOfBirth = dateOfBirth;
       this.age = getDiffYears(dateOfBirth, new Date());
   }
   
   // standard getters and setters
   private int getDiffYears(Date first, Date last) {
       Calendar a = getCalendar(first);
       Calendar b = getCalendar(last);
       int diff = b.get(YEAR) - a.get(YEAR);
       if (a.get(MONTH) > b.get(MONTH) ||
               (a.get(MONTH) == b.get(MONTH) && a.get(DATE) > b.get(DATE))) {
           diff--;
       }
       return diff;
   }
   
   private Calendar getCalendar(Date date) {
       Calendar cal = Calendar.getInstance(Locale.US);
       cal.setTime(date);
       return cal;
   }
   
   @Override
   public String toString() {
       return String.format("User{userId='%s', name='%s', age=%d, dateOfBirth=%s}\n",
               userId, name, age, dateOfBirth);
   }
}