<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CC | Course Scheduler</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<style>
	body {
		padding: 50px !important;
	}
</style>
</head>
<body>	
	<h1 class="ui header">Course Scheduler</h1>
	<h4 class="ui horizontal divider header">
	  <i class="shopping cart icon"></i>
	  COURSE CART
	</h4>
	<div class="ui two column grid">
		<div class="row">
			<div class="eight wide column">
				<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
					<c:if test="${not empty requestScope.courses}">
						<table class="ui striped table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Professor</th>
									<th>Location</th>
									<th>Times</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.courses}" var="course">
									<tr>
										<td><c:out value="${course.name}"></c:out></td>
										<td><c:out value="${course.professor}"></c:out></td>
										<td><c:out value="${course.location}"></c:out></td>
										<td><c:out value="${course.times}"></c:out></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
			<div class="eight wide column">
				<h3>Actions:</h3>
				<p><a href="/search">Search for Courses</a></p>
			</div>
		</div>
	</div>
		
	<h4 class="ui horizontal divider header">
	  <i class="bookmark icon"></i>
	  ENROLLED COURSES
	</h4>
	<div class="ui two column grid">
		<div class="row">
			<div class="eight wide column">
				<div style="min-height: 300px; max-height: 300px; overflow-y: auto;">
					<c:if test="${not empty requestScope.enrolledCourses}">
						<table class="ui striped table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Professor</th>
									<th>Location</th>
									<th>Times</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${requestScope.enrolledCourses}" var="enrolledCourse">
									<tr>
										<td><c:out value="${enrolledCourse.name}"></c:out></td>
										<td><c:out value="${enrolledCourse.professor}"></c:out></td>
										<td><c:out value="${enrolledCourse.location}"></c:out></td>
										<td><c:out value="${enrolledCourse.times}"></c:out></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
				</div>
			</div>
			<div class="eight wide column">
				<h3>Actions:</h3>
				<p><a href="/enrollCourse">View Enrolled Courses</a></p>
				<p><a href="/droppedCoursesList">View Dropped Courses</a></p>
			</div>
		</div>
	</div>
</body>
</html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>