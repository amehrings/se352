<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Search Courses</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		padding-bottom: 50px !important;
		background-color: aliceblue !important;
	}
	
	.paddings{
		padding-top: 2%;
		padding-left: 5%;
		padding-right: 5%;
		padding-bottom: 5%;
	}
</style>
</head>
<body>
	<div class="ui menu">
	  <div class="header item">
	    CampusConnect
	  </div>
	  <a class="item" href="courseScheduler">
	    Home
	  </a>
	  <a class="item" href="enrollCourse">
	    Course Cart
	  </a>
	  <a class="item" href="enrolledCourses">
	    Enrolled Courses
	  </a>
	  <a class="item" href="droppedCoursesList">
	    Dropped
	  </a>
	</div>
	
	<div class="paddings">
		<h1 class="ui horizontal divider header">
		  <i class="search icon"></i>
		  SEARCH
		</h1>
					

	<c:url value="courseScheduler" var="schedulerURL"></c:url>

	<%-- Search Request --%>
	<form action="doSearch" class="ui form" method="get">
		<div class="field">
			<label>Search: </label>
			<input type="text" id="inp" name="search" maxlength="15" placeholder="search for a class...">
			<p style="color:gray">Press enter to search</p>
		</div>
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
					<th>Add Course</th>
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
					<c:url value="/enrollCourse" var="courseCartCourseURL">
						<c:param name="id" value="${course.id}"></c:param>
						<c:param name="name" value="${course.name}"></c:param>
						<c:param name="location" value="${course.location}"></c:param>
						<c:param name="professor" value="${course.professor}"></c:param>
						<c:param name="times" value="${course.times}"></c:param>
						<c:param name="description" value="${course.description}"></c:param>
					</c:url>
					<tr id="output">
						<td><c:out value="${course.id}"></c:out></td>
						<td><c:out value="${course.name}"></c:out></td>
						<td><c:out value="${course.description}"></c:out></td>
						<td><c:out value="${course.professor}"></c:out></td>
						<td><c:out value="${course.location}"></c:out></td>
						<td><c:out value="${course.times}"></c:out></td>
						<td>
							<a href='<c:out value="${courseCartCourseURL}" escapeXml="true"></c:out>'>Add</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	</div>
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
