
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Courses</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		padding: 50px !important;
	}
</style>
</head>
<body>
	
	<c:url value="/addCourse" var="addURL"></c:url>
	<c:url value="/editCourse" var="editURL"></c:url>
	<c:url value="courseScheduler" var="schedulerURL"></c:url>

	<div class="ui divider"></div>
	<form action="enrollCourse">
		<button type="submit" class="ui button primary">Enroll in Courses</button>
		<button type="submit" formaction="search" class="ui button primary">Search for Courses</button>
		<button type="submit" formaction="getCourses" class="ui button secondary">View Course Scheduler</button>
		
	</form>
	<!-- <form action="getCourses">
		<button type="submit" formaction="getCourses" class="ui button secondary">View Course Scheduler</button>
	</form> -->
	<div class="ui divider"></div>
	<%-- Course Add/Edit logic --%>
	<c:if test="${requestScope.error ne null}">
		<strong style="color: red;"><c:out
				value="${requestScope.error}"></c:out></strong>
	</c:if>
	<c:if test="${requestScope.success ne null}">
		<strong style="color: green;"><c:out
				value="${requestScope.success}"></c:out></strong>
	</c:if>
	<%-- Edit Request --%>
	<c:if test="${requestScope.course ne null}">
		<form action='<c:out value="${editURL}"></c:out>' method="post" class="ui form">
			<div class="field"><label>Course ID: </label><input type="text" value="${requestScope.course.id}" readonly="readonly" name="id"></div>
				<div class="two fields"><div class="field"><label>Course Name: </label><input type="text" value="${requestScope.course.name}" name="name" maxlength="7"></div>
				<div class="field"><label>Course Location: </label><input type="text" value="${requestScope.course.location}" name="location" maxlength="15"></div></div>
				<div class="field"><label>Course Description: </label><input type="text" value="${requestScope.course.description}" name="description" maxlength="30"></div>
				<div class="two fields"><div class="field"><label>Course Professor: </label><input type="text" value="${requestScope.course.professor}" name="professor" maxlength="30"></div>
				<div class="field"><label>Course Times: </label><input type="text" value="${requestScope.course.times}" name="times" maxlength="10"></div></div>
				<button type="submit" class="ui button">Edit Course</button>
		</form>
	</c:if>

	<%-- Add Request --%>
	<c:if test="${requestScope.course eq null}">
		<form action='<c:out value="${addURL}"></c:out>' method="post" class="ui form">
			<div class="two fields"><div class="field"><label>Course Name: </label><input type="text" name="name" maxlength="7"></div> 
			<div class="field"><label>Course Location: </label><input type="text" name="location" maxlength="15"></div></div>
			<div class="field"><label>Course Description: </label><input type="text" name="description" maxlength="30"></div>
			<div class="two fields"><div class="field"><label>Course Professor: </label><input type="text" name="professor" maxlength="30"></div>
			<div class="field"><label>Course Times: </label><input type="text" name="times" maxlength="10"></div></div>
			<button type="submit" class="ui button">Add Course</button>
		</form>
	</c:if>	
	
	
	<br> 
	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.courses}">
		<table class="ui celled table">
			<tbody>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Description</th>
					<th>Professor</th>
					<th>Location</th>
					<th>Times</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<c:forEach items="${requestScope.courses}" var="course">
					<c:url value="/editCourse" var="editURL">
						<c:param name="id" value="${course.id}"></c:param>
					</c:url>
					<c:url value="/deleteCourse" var="deleteURL">
						<c:param name="id" value="${course.id}"></c:param>
					</c:url>
					<tr>
						<td><c:out value="${course.id}"></c:out></td>
						<td><c:out value="${course.name}"></c:out></td>
						<td><c:out value="${course.description}"></c:out></td>
						<td><c:out value="${course.professor}"></c:out></td>
						<td><c:out value="${course.location}"></c:out></td>
						<td><c:out value="${course.times}"></c:out></td>
						<td><a
							href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
						<td><a
							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	
	<br/>
	<br/>
	<br/>
	<%-- <!-- USERS -->
	<c:url value="/addUser" var="addUserURL"></c:url>
	<c:url value="/editUser" var="editUserURL"></c:url>
	<c:if test="${requestScope.user eq null}">
		<form action='<c:out value="${addUserURL}"></c:out>' method="post">
			Name: <input type="text" name="name"> 
			<br> Courses (comma separated): <input type="text" name="courses">
			<br> Date of Birth: <input type="text" name="dateOfBirth">
			<br> <input type="submit" value="Add User">
		</form>
	</c:if> --%>
	
		<!-- <a href="enrollCourse">Course Enroll</a> -->
		

<%-- 	<a href="<c:url value="enrollCourse.jsp" var="enrollURL"></c:url>"><button>Course Enroll</button></a> --%>
	
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
