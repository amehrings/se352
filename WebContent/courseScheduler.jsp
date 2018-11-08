
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
	<div>
	<%-- Courses List Logic --%>
	<h3>Course Cart Courses </h3>
	<c:if test="${not empty requestScope.courses}">
		<table class="ui striped table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Edit</th>
					<th>Delete</th>
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
						<td><c:out value="${person.location}"></c:out></td>
						<td><a
							href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
						<td><a
							href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<div class="ui divider"></div>
	<h3>Actions:</h3>
	<p><a href="enrollCourse">Search for Courses</a></p>
	<p><a href="enrollCourse">View Course Cart Courses</a></p>
	<p><a href="enrollCourse">View Enrolled Courses</a></p>
	</div>
	<br/><br/><br/>	
	<div>
		<h3>Enrolled Courses </h3>
		<c:if test="${not empty requestScope.enrollCourses}">
			<p>test</p>
			<table>
				<tbody>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<c:forEach items="${requestScope.enrollCourses}" var="course">
						<c:url value="/editCourse" var="editURL">
							<c:param name="id" value="${course.id}"></c:param>
						</c:url>
						<c:url value="/deleteCourse" var="deleteURL">
							<c:param name="id" value="${course.id}"></c:param>
						</c:url>
						<tr>
							<td><c:out value="${course.id}"></c:out></td>
							<td><c:out value="${course.name}"></c:out></td>
							<td><c:out value="${person.location}"></c:out></td>
							<td><a
								href='<c:out value="${editURL}" escapeXml="true"></c:out>'>Edit</a></td>
							<td><a
								href='<c:out value="${deleteURL}" escapeXml="true"></c:out>'>Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<div class="ui divider"></div>
		<h3>Actions:</h3>
		<p><a href="enrollCourse">Search for Courses</a></p>
		<p><a href="enrollCourse">View Course Cart Courses</a></p>
		<p><a href="enrollCourse">View Enrolled Courses</a></p>
	</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>