
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
	<h1> to be complete </h1>
	<c:url value="courseScheduler" var="schedulerURL"></c:url>

	<div class="ui divider"></div>
	<!-- <form action="enrollCourse">
		<button type="submit" formaction="enrollCourse" class="ui button primary">Enroll in Courses</button>
		<button type="submit" formaction="courses.jsp" class="ui button Primary">Add/Edit Courses</button>
		<button type="submit" formaction="getCourses" class="ui button secondary">View Course Scheduler</button>
		
	</form> -->
	<%-- Search Request --%>
	<form action="" class="ui form">
		<div class="field"><label>Search: </label><input type="text" name="search" maxlength="15" placeholder="search for a class..."></div>
	</form>
	
	
	<br> 
	<%-- Courses List Logic --%>
	<c:if test="${not empty requestScope.courses}">
		<table class="ui celled table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Description</th>
					<th>Professor</th>
					<th>Location</th>
					<th>Times</th>
				</tr>
			</thead>
			<tbody>
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
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>