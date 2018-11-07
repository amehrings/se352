# Campus Connect 2.0

Aaron Mehrings, Artur Oganezov, & Megan Pecho

## Milestone 4

###### Sequence of major functionality from user interface to persistence



###### Lessons learned



###### Decision log and consequence of the decision



###### Discussion about the lessons learned



![Successful build](./milestone4_successfulBuild.PNG)
![Running server](./milestone4_runningProject.PNG)

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
  - [ ] Adding classes to your course cart.
  - [ ] Removing classes from your course cart.
  - [x] Enrolling in classes.
  - [x] Dropping classes.
  - [ ] Swapping a class you’re registered in for a class in your course cart.
  - [ ] Seeing a calendar view of your classes.
  - [ ] Seeing list of dropped classes.
  - [ ] Calendar view of course cart classes.
  - [ ] Create classes as an administrator
  - [ ] Delete classes as admin.
  - [ ] Edit Classes as admin.
  - [ ] Remove students from enrolled classes
  - [ ] View enrolled students


## Description of Problem
The current campus connect is very bulky and hides key features. Campus Connect 2.0 will make it easy to enroll and handle coursework - one of it’s most essential features.

## How Design Meets the Requirements
The requirements were to have 3 major functionalities, use a database, and Javascript and HTML - essentially a web UI. As we’d like to team up for this assignment, we have proposed 12-14 key functionalities to increase difficulty appropriately. We are planning to need some tables for the database component, but how many exactly will be determined as we move forward with design. Finally, this will be a web version of Campus Connect, so we’ll be using HTML and Javascript for our Web UI.


## Team Work Breakdown

|Megan|Aaron|Artur|
| ------------- | ------------- | ------------- |
|Searching for classes to take.|Enrolling in classes.|Create classes as an administrator.|
|Adding classes to your course cart.|Dropping classes.|Delete classes as admin.|
|Removing classes from your course cart.|Swapping a class you’re registered in for a class in your course cart.|Edit Classes as admin.|
|Seeing a calendar view of your classes. |Seeing list of dropped classes.|Remove students from enrolled classes.|
|Calendar view of course cart classes.||View enrolled students.|

As a team, we have worked on many projects together over the last 2 years. If a team member is unable to deliver for whatever reason, we are able to cover some of the work for them. Since we know each other well, we know we won’t have consistent delivery issues.

## Design
In pdf
