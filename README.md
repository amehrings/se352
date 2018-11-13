# Campus Connect 2.0

Aaron Mehrings, Artur Oganezov, & Megan Pecho

## Milestone 4

###### Sequence of major functionality from user interface to persistence

We currently are not differentiating between students and admins.

Every user can currently add a new course to the list. Users are yet to be defined.

The current user can then view all the courses, enroll in courses, and drop courses, and view the courses in each of those states. We save all of these states and each user sees the same thing. We have not implemented separate users (at least as of yet). 

###### Lessons learned

For this milestone, we have set up Tomcat within Eclipse to make our deployment cycle easier. We have also extended upon our knowledge of servlets and connecting them to the jsp pages. 

###### Decision log and consequence of the decision

In this milestone, we decided to use a css library to style our site rather than rely on our mockups and do the styles ourselves. We decided to use Semantic-UI as it is pretty and easy to use, and it gave us the feel we were looking for, though we did look at Bootstrap and Material as options. Those were too light-weight for us.

###### Discussion about the lessons learned

If we had a bit more time and decided this sooner, we would have preferred to use a library like React or framework like Angular to make the front-end easier to deal with and have the ability to dynamically show content out of the box, ie. not have to reload the page each time an action is completed.

![Successful build](/milestone4_successfulBuild.png)
![Running server](/milestone4_runningProject.png)

---

## Running Instructions

We currently deploy to Tomcat a .war file that the pom.xml file generates.

Steps to run include:

```
mvn clean package
```

Then deploy to Tomcat server however you choose. We are all using v9.0 and project structure and dependencies set up to allow project to be deployed to Tomcat within Eclipse.


---
## Overview
This version of campus connect will have a simple way to register for classes, swap out the classes you’re in, and drop classes.

## Requirements
#### Use Cases
  - [ ] Searching for classes to take.
  - [x] Adding classes to your course cart.
  - [x] Removing classes from your course cart.
  - [x] Enrolling in classes.
  - [x] Dropping classes.
  - [x] Swapping a class you’re registered in for a class in your course cart.
  - [x] Seeing list of dropped classes.
  - [x] Create classes as an administrator
  - [x] Delete classes as admin.
  - [x] Edit Classes as admin.
  - [ ] Schedule Advising meeting and see available times
  - [ ] Cancel Advising meeting after scheduling 
  - [ ] Edit Advising meeting and add reason for scheduling


## Description of Problem
The current campus connect is very bulky and hides key features. Campus Connect 2.0 will make it easy to enroll and handle coursework - one of it’s most essential features.

## How Design Meets the Requirements
The requirements were to have 3 major functionalities, use a database, and Javascript and HTML - essentially a web UI. As we’d like to team up for this assignment, we have proposed 12-14 key functionalities to increase difficulty appropriately. We are planning to need some tables for the database component, but how many exactly will be determined as we move forward with design. Finally, this will be a web version of Campus Connect, so we’ll be using HTML and Javascript for our Web UI.


## Team Work Breakdown

|Megan|Aaron|Artur|
| ------------- | ------------- | ------------- |
|Create classes as an administrator.|Enrolling in classes.|Searching for classes to take.|
|Removing classes from your course cart.|Dropping classes.|Delete classes as admin.|
|Seeing list of dropped classes.|Swapping a class you’re registered in for a class in your course cart.|Edit Classes as admin.|
|Cancel Advising meeting after scheduling|Adding classes to your course cart|Edit Advising meeting and add reason for scheduling|
|Schedule Advising meeting and see available times|||

As a team, we have worked on many projects together over the last 2 years. If a team member is unable to deliver for whatever reason, we are able to cover some of the work for them. Since we know each other well, we know we won’t have consistent delivery issues.

## Design
In pdf
